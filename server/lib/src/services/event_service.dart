// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drift/drift.dart';
import 'package:grpc/grpc.dart';

import 'package:grpg_streaming/src/database/database.dart' as db;
import 'package:grpg_streaming/src/generated/index.dart';

class EventService extends EventServiceBase {
  final db.EventsDatabase database;
  EventService({
    required this.database,
  });

  int _ensureAuthenticated(ServiceCall call) {
    final userIdValue = (call.clientMetadata ?? {})['user_id'];

    if (userIdValue == null) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
    final userId = int.tryParse(userIdValue);
    if (userId == null) {
      throw GrpcError.unauthenticated('User not authenticated');
    }
    return userId;
  }

  @override
  Future<Event> createEvent(
    ServiceCall call,
    CreateEventRequest request,
  ) async {
    final event = request.event;
    final userId = _ensureAuthenticated(call);

    final savedEvent = await database.addEvent(
      event.title,
      event.description,
      event.time.toDateTime(),
      event.location,
      userId,
    );
    return savedEvent.toGrpcEvent();
  }

  @override
  Future<Event> getEvent(
    ServiceCall call,
    GetEventRequest request,
  ) async {
    final event = await database.getEvent(request.id).getSingleOrNull();
    if (event == null) {
      throw GrpcError.notFound('Event not found');
    }
    return event.toGrpcEvent();
  }

  @override
  Future<Empty> deleteEvent(
    ServiceCall call,
    DeleteEventRequest request,
  ) async {
    final userId = _ensureAuthenticated(call);
    final event = await database.getEvent(request.id).getSingleOrNull();
    if (event == null) {
      print(await database.listEvents());
      throw GrpcError.notFound('Event ${request.id} not found');
    }
    if (event.creatorId != userId) {
      throw GrpcError.permissionDenied('You are not the creator of this event');
    }
    await database.deleteEvent(request.id);
    return Empty();
  }

  @override
  Future<ListEventsResponse> listEvents(
    ServiceCall call,
    ListEventsRequest request,
  ) async {
    final events = await database.listEvents();
    return ListEventsResponse(
      events: events.map((e) => e.toGrpcEvent()).toList(),
    );
  }

  @override
  Stream<StreamEventsResponse> streamEvents(
    ServiceCall call,
    StreamEventsRequest request,
  ) async* {
    final newEventsStream = database.events.all().watch();
    yield* newEventsStream.map(
      (changes) => StreamEventsResponse(
        events: changes.map((e) => e.toGrpcEvent()),
      ),
    );
  }
}

extension on db.Event {
  Event toGrpcEvent() {
    return Event(
      id: id,
      title: title,
      description: description,
      time: Timestamp.fromDateTime(time),
      location: location,
    );
  }
}
