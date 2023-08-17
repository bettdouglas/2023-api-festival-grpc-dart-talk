import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';

part 'stream_events_state.freezed.dart';

@freezed
class StreamEventsState with _$StreamEventsState {
  const factory StreamEventsState.initial() = _Initial;
  const factory StreamEventsState.loading() = _Loading;
  const factory StreamEventsState.loaded({
    required List<Event> events,
  }) = _Loaded;
  const factory StreamEventsState.error({
    required String message,
    List<Event>? events,
  }) = _Error;
}
