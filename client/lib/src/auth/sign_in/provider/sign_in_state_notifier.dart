// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:grpc_streaming/src/auth/provider/auth_repository.dart';
import 'package:grpc_streaming/src/auth/sign_in/provider/sign_in_repository.dart';
import 'package:grpc_streaming/src/auth/sign_in/provider/sign_in_states.dart';
import 'package:grpc_streaming/src/shared/service_client_providers.dart';

class SignInNotifier extends StateNotifier<LoginState> {
  SignInNotifier({
    required this.authRepository,
    required this.signInRepository,
  }) : super(const LoginState.initial());

  final AuthRepository authRepository;
  final SignInRepository signInRepository;

  login(String username, String password) async {
    if (username.isEmpty || password.isEmpty) {
      state = const LoginState.error('Username or password is empty');
    } else {
      state = const LoginState.loading();

      final loginResult = await signInRepository.signIn(username, password);

      await loginResult.fold(
        (l) {
          state = LoginState.error('Failed to login. $l');
        },
        (user) async {
          final result = await authRepository.saveUser(user);
          state = result.fold(
            () => const LoginState.error('Failed to login'),
            (savedUser) => LoginState.loggedIn(savedUser),
          );
        },
      );
    }
  }
}

final signInProvider = StateNotifierProvider<SignInNotifier, LoginState>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return SignInNotifier(
    authRepository: authRepository,
    signInRepository: SignInRepository(
      userServiceClient: ref.read(userServiceClientProvider),
    ),
  );
});

///captain,technical,technical_manager,admin
final rolePermissionsMapping = {
  'captain': ['captain', 'technical'],
  'technical': ['technical'],
  'technical_manager': ['technical', 'technical_manager'],
  'admin': ['admin', 'technical', 'technical_manager', 'captain'],
};
