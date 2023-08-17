import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:uuid/uuid.dart';

part 'database.g.dart';

final _uuid = Uuid();

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get username => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get passwordHash => text()();
}

class Events extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get description => text()();
  TextColumn get location => text()();
  DateTimeColumn get time => dateTime()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
  IntColumn get creatorId => integer().references(Users, #id)();
}

class Quotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get createdBy => integer().references(Users, #id)();
}

@DriftDatabase(tables: [Users, Events, Quotes])
class EventsDatabase extends _$EventsDatabase {
  final QueryExecutor queryExecutor;

  EventsDatabase(this.queryExecutor) : super(queryExecutor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from == 1) {
            await m.createTable(quotes);
          }
        },
      );

  Future<User> addUser(String username, String passwordHash) async {
    final result = await into(users).insert(
      UsersCompanion.insert(
        username: username,
        createdAt: DateTime.now(),
        passwordHash: passwordHash,
      ),
    );
    final got = await getUser(result).getSingleOrNull();
    if (got == null) {
      throw Exception('Failed to add user');
    } else {
      return got;
    }
  }

  Future updateUser(User user) {
    return update(users).replace(user);
  }

  SingleOrNullSelectable<User> getUser(int id) {
    return select(users)..where((tbl) => tbl.id.equals(id));
  }

  SingleOrNullSelectable<User> getUserByName(String username) {
    return select(users)..where((tbl) => tbl.username.equals(username));
  }

  Future<void> deleteUser(int id) {
    return (delete(users)..where((tbl) => tbl.id.equals(id))).go();
  }

  MultiSelectable<User> watchUsers(List<int> id) {
    return select(users)..where((tbl) => tbl.id.isIn(id));
  }

  MultiSelectable<User> listUsers() {
    return select(users)..orderBy([(u) => OrderingTerm(expression: u.id)]);
  }

  Future<Event> addEvent(
    String title,
    String description,
    DateTime time,
    String location,
    int creatorId,
  ) async {
    final id = await into(events).insert(
      EventsCompanion.insert(
        title: title,
        description: description,
        creatorId: creatorId,
        location: location,
        time: time,
      ),
    );
    final got = await getEvent(id).getSingleOrNull();
    return got ?? (throw Exception('Failed to create event'));
  }

  SingleOrNullSelectable<Event> getEvent(int id) {
    return select(events)..where((tbl) => tbl.id.equals(id));
  }

  Future<void> deleteEvent(int id) {
    return (delete(events)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<List<Event>> listEvents() {
    return select(events).get();
  }

  static LazyDatabase openNativeDatabase(String databaseName) {
    // the LazyDatabase util lets us find the right location for the file async.
    return LazyDatabase(() async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final file = File(databaseName);
      return NativeDatabase.createInBackground(file);
    });
  }

  static LazyDatabase openMemoryDatabase() {
    return LazyDatabase(() async {
      return NativeDatabase.memory();
    });
  }
}
