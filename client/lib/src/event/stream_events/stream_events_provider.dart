import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/event/providers.dart';
import 'package:grpc_streaming/src/event/stream_events/stream_events_state.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';

class StreamEventsStateNotifier extends StateNotifier<StreamEventsState> {
  StreamEventsStateNotifier({
    required this.eventServiceClient,
  }) : super(const StreamEventsState.initial()) {
    init();
  }

  final EventServiceClient eventServiceClient;
  final _events = <Event>[];
  late StreamSubscription _subscription;

  init() {
    state = const StreamEventsState.loading();
    final eventsStream = eventServiceClient.streamEvents(
      StreamEventsRequest(pageSize: 3),
    );
    _subscription = eventsStream.listen(
      (value) {
        state = StreamEventsState.loaded(events: [..._events, ...value.events]);
      },
      onError: (error) {
        state = StreamEventsState.error(
          message: error.toString(),
          events: _events,
        );
      },
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

final streamEventsStateNotifierProvider = StateNotifierProvider.autoDispose<
    StreamEventsStateNotifier, StreamEventsState>(
  (ref) => StreamEventsStateNotifier(
    eventServiceClient: ref.watch(eventServiceClientProvider),
  ),
);
