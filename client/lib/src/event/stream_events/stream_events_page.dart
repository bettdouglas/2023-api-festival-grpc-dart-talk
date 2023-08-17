import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/event/stream_events/stream_events_provider.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';

class StreamEventsPage extends ConsumerWidget {
  const StreamEventsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(streamEventsStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Events'),
      ),
      body: state.when(
        initial: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
        loaded: (events) {
          return EventsListView(events: events);
        },
        error: (message, events) {
          return Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.error),
                  Text('Some Error Happened: $message'),
                ],
              ),
              const SizedBox(height: 20),
              if (events != null) EventsListView(events: events),
            ],
          );
        },
      ),
    );
  }
}

class EventsListView extends StatelessWidget {
  const EventsListView({
    required this.events,
    super.key,
  });

  final List<Event> events;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final event = events[index];
        return ListTile(
          title: Text(event.title),
          subtitle: Text(event.description),
          onTap: () {},
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
          ),
        );
      },
    );
  }
}
