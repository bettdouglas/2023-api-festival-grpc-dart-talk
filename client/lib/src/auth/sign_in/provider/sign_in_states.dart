import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state.dart';

part 'sign_in_states.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.loggedIn(User user) = _Authenticated;
  const factory LoginState.error(String message) = _Error;
}
