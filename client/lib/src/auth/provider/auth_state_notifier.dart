import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/auth/provider/auth_repository.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier({
    required this.authRepository,
  }) : super(const AuthState.unauthenticated()) {
    _init();
  }

  final AuthRepository authRepository;

  void _init() async {
    state = const AuthState.loading();
    try {
      final getUserResponse = await authRepository.getUser();
      state = getUserResponse.fold(
        () => const AuthState.unauthenticated(),
        (user) => AuthState.authenticated(user),
      );
    } catch (e) {
      state = const AuthState.unauthenticated();
    }
  }

  void signOut() async {
    await authRepository.logout();
    _init();
  }
}

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) {
    final authRepository = ref.read(authRepositoryProvider);
    return AuthStateNotifier(authRepository: authRepository);
  },
);

// final authRefreshListenable = Provider<Listenable>((ref) {
//   final authNotifier = ref.watch(authStateProvider.notifier);
//   return authNotifier;
// });
class AuthRefreshListenable extends ChangeNotifier {
  final Ref ref;

  AuthRefreshListenable({required this.ref}) {
    ref.listen(authStateProvider, (previous, next) {
      notifyListeners();
    });
  }
}
