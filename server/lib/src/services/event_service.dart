import 'package:grpc/grpc.dart';
import 'package:grpg_streaming/src/generated/event_service.pbgrpc.dart';

class EventService extends EventServiceBase {
  @override
  Future<DeleteEventResponse> deleteEvent(
    ServiceCall call,
    DeleteEventRequest request,
  ) async {
    // TODO: implement deleteEvent
    throw UnimplementedError();
  }

  @override
  Future<ListEventsResponse> listEvents(
    ServiceCall call,
    ListEventsRequest request,
  ) async {
    // TODO: implement listEvents
    throw UnimplementedError();
  }

  @override
  Future<Event> postEvent(
    ServiceCall call,
    CreateEventRequest request,
  ) async {
    // TODO: implement postEvent
    throw UnimplementedError();
  }

  @override
  Future<StreamEventsResponse> streamEvents(
    ServiceCall call,
    StreamEventsRequest request,
  ) async {
    // TODO: implement streamEvents
    throw UnimplementedError();
  }
}
