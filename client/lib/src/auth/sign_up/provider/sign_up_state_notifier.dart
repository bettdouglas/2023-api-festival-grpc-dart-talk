import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/auth/provider/auth_repository.dart';
import 'package:grpc_streaming/src/auth/sign_up/provider/sign_up_repository.dart';
import 'package:grpc_streaming/src/auth/sign_up/provider/sign_up_states.dart';
import 'package:grpc_streaming/src/shared/service_client_providers.dart';

class SignUpStateNotifier extends StateNotifier<SignUpState> {
  SignUpStateNotifier({
    required this.signUpRepository,
    required this.authRepository,
  }) : super(const SignUpState.initial());

  final SignUpRepository signUpRepository;
  final AuthRepository authRepository;

  void signUp(String username, String password) async {
    state = const SignUpState.loading();
    final signUpResult = await signUpRepository.signUp(username, password);
    await signUpResult.fold(
      (l) {
        state = SignUpState.error('Failed to sign up. $l');
      },
      (user) async {
        final result = await authRepository.saveUser(user);
        state = result.fold(
          () => const SignUpState.error('Failed to sign up'),
          (savedUser) => SignUpState.signedUp(savedUser),
        );
      },
    );
  }
}

final signUpProvider = StateNotifierProvider<SignUpStateNotifier, SignUpState>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    return SignUpStateNotifier(
      authRepository: authRepository,
      signUpRepository: SignUpRepository(
        userServiceClient: ref.read(userServiceClientProvider),
      ),
    );
  },
);
