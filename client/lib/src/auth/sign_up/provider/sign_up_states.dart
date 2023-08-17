import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state.dart';

part 'sign_up_states.freezed.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = _Loading;
  const factory SignUpState.signedUp(User user) = _Success;
  const factory SignUpState.error(String error) = _Error;
}
