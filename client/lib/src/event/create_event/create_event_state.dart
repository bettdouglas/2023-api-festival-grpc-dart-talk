import 'package:grpc_streaming/src/shared/grpc-gen/index.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_state.freezed.dart';

@freezed
class CreateEventState with _$CreateEventState {
  const factory CreateEventState.initial() = _Initial;
  const factory CreateEventState.creating(String msg) = _Creating;
  const factory CreateEventState.created(Event event) = _Created;
  const factory CreateEventState.error(String msg) = _Error;
}
