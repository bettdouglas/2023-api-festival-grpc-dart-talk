import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:faker_dart/faker_dart.dart';
import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/generated/index.dart';
import 'package:test/test.dart';

void main() {
  final port = Random().nextInt(max(65535, 1024));
  final host = 'http://0.0.0.0';
  late Process p;
  late ClientChannel channel;

  setUpAll(() async {
    p = await Process.start(
      'dart',
      ['run', 'bin/server.dart'],
      environment: {'PORT': '$port', 'TEST_MODE': 'true'},
    );
    // // Wait for server to start and print to stdout.
    final stdout = p.stdout.asBroadcastStream().transform(utf8.decoder);
    final log = await stdout
        .firstWhere((element) => element.contains('Server listening on'));
    print(log);
    stdout.forEach(print);

    // stdout.forEach((element) {

    // final log = await stdout.firstWhere((element) => element.contains('Server listening on'));
    // // stdout.forEach((element) {
    // //   print(String.fromCharCodes(element));
    // // });
    // p.stderr.transform(utf8.decoder).forEach(print);

    // print(String.fromCharCodes(log));
    channel = ClientChannel(
      InternetAddress
          .anyIPv4, // host address. this will point to localhost for now
      port: port,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        // this means we're sending unsecured http traffic.
      ),
    );
  });

  tearDownAll(() => p.kill());

  group('UserService', () {
    late UserServiceClient client;
    late User user;

    setUp(() async {
      client = UserServiceClient(channel);
      final response = await client.createUser(CreateUserRequest(
        user: User(name: 'test'),
      ));
      user = response.user;
      addTearDown(() => client.deleteUser(DeleteUserRequest(id: user.id)));
    });

    test('can add user', () async {
      // expect(user.id, isNotEmpty);
      expect(user.id, isNot(0));
    });

    test('can get a user', () async {
      final got = await client.getUser(GetUserRequest(id: user.id));
      expect(got.id, user.id);
      expect(got.name, user.name);
    });
    test('can delete a user', () async {
      await client.deleteUser(DeleteUserRequest(id: user.id));
      expect(
        () async => await client.getUser(GetUserRequest(id: user.id)),
        throwsA(
          isA<GrpcError>().having(
            (error) => error.code,
            'has NotFoundCode',
            StatusCode.notFound,
          ),
        ),
      );
    });
    test('cannot update a user ', () async {
      expect(
        () async => await client.updateUser(UpdateUserRequest()),
        throwsA(
          isA<GrpcError>().having(
            (p0) => p0.code,
            'Unimplemented status code',
            StatusCode.unimplemented,
          ),
        ),
      );
    });

    test('can stream users ', () async {
      final usersStream = client.streamUsers(StreamUsersRequest()).take(3);
      var count = 0;
      usersStream.listen(
        expectAsync1(
          (event) {
            count++;
            if (count == 1) {
              expect(event.users, isNotEmpty);
            }

            if (count == 2) {
              expect(
                event.users.map((e) => e.name),
                containsAllInOrder([user.name, 'test2']),
              );
            }
            if (count == 3) {
              expect(
                event.users.map((e) => e.name),
                containsAllInOrder([user.name, 'test2', 'test3']),
              );
            }
          },
          count: 3,
          // because of tearDown delete???
        ),
      );
      await client.createUser(CreateUserRequest(user: User(name: 'test2')));
      await client.createUser(CreateUserRequest(user: User(name: 'test3')));
    });
    test('can stream updates on a specific user', () async {
      // final userStream = client.streamUser(
      //   StreamUserRequest(id: user.id),
      // );
      // var count = 0;
      // userStream.listen(
      //   expectAsync1(
      //     (event) {
      //       count++;
      //       expect(event.user, isNotNull);
      //       expect(event.user.id, user.id);
      //       expect(event.user.name, user.name);

      //       if (count == 2) {
      //         expect(event.user.name, 'test2');
      //       }
      //       if (count == 3) {
      //         expect(event.user.name, 'test3');
      //       }
      //     },
      //     count: 3,
      //   ),
      // );
      // await client.createUser(CreateUserRequest(user: User(name: 'test2')));
    }, skip: true);
  });

  group('EventService', () {
    late EventServiceClient eventServiceClient;
    late UserServiceClient client;
    late User user;
    late Event event;
    late CallOptions callOptions;

    setUpAll(() {
      eventServiceClient = EventServiceClient(channel);
    });

    setUp(() async {
      client = UserServiceClient(channel);
      final response = await client.createUser(CreateUserRequest(
        user: User(name: 'test'),
      ));
      user = response.user;
      callOptions = CallOptions(
        metadata: {'token': response.accessToken},
      );
      addTearDown(() => client.deleteUser(DeleteUserRequest(id: user.id)));
      event = await eventServiceClient.createEvent(
        CreateEventRequest(event: fakeEvent()),
        options: callOptions,
      );
      addTearDown(
        () => eventServiceClient.deleteEvent(
          DeleteEventRequest(id: event.id),
          options: callOptions,
        ),
      );
    });

    test('can add event', () async {
      expect(event.id, isNot(0));
    });
    test('can get an event', () async {
      final got = await eventServiceClient.getEvent(
        GetEventRequest(id: event.id),
        options: callOptions,
      );
      expect(got, equals(event));
    });
    test('can delete an event', () async {
      print(event);

      await eventServiceClient.deleteEvent(
        DeleteEventRequest(id: event.id),
        options: callOptions,
      );
      expect(
        () async => await eventServiceClient.getEvent(
          GetEventRequest(id: event.id),
          options: callOptions,
        ),
        throwsA(
          isA<GrpcError>().having(
            (error) => error.code,
            'has NotFoundCode',
            StatusCode.notFound,
          ),
        ),
      );
    });

    test('can stream events ', () async {});
    test('can stream updates on a specific event', () async {});
  });
}

Event fakeEvent() {
  return Event(
    title: Faker.instance.lorem.sentence(),
    description: Faker.instance.lorem.sentence(),
    image: Faker.instance.image.image(),
    location: Faker.instance.address.streetAddress(),
    time: Timestamp.fromDateTime(Faker.instance.datatype.dateTime()),
  );
}
