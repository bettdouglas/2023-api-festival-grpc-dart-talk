import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_streaming/src/event/create_event/create_event_state.dart';
import 'package:grpc_streaming/src/event/providers.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';

class CreateEventStateNotifier extends StateNotifier<CreateEventState> {
  CreateEventStateNotifier({
    required this.eventServiceClient,
  }) : super(const CreateEventState.initial());

  final EventServiceClient eventServiceClient;

  void createEvent(
    String title,
    String description,
    String location,
    DateTime dateTime,
  ) async {
    state = const CreateEventState.creating('Creating event ...');
    try {
      final event = await eventServiceClient.createEvent(
        CreateEventRequest(
          event: Event(
            title: title,
            description: description,
            location: location,
            time: Timestamp.fromDateTime(dateTime),
          ),
        ),
      );
      state = CreateEventState.created(event);
    } on GrpcError catch (e) {
      state = CreateEventState.error(e.message ?? 'Error creating event .$e');
    }
  }
}

final createEventStateNotifierProvider = StateNotifierProvider.autoDispose<
    CreateEventStateNotifier, CreateEventState>(
  (ref) => CreateEventStateNotifier(
    eventServiceClient: ref.watch(eventServiceClientProvider),
  ),
);
