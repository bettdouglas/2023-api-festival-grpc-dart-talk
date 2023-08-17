import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/auth_state_notifier.dart';

class SignOutPage extends ConsumerWidget {
  const SignOutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Out Page'),
      ),
      body: Center(
        child: authState.maybeWhen(
          orElse: () => null,
          authenticated: (user) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text(
                    'You are signed in as ${user.username}',
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      ref.read(authStateProvider.notifier).signOut();
                    },
                    child: const Text('Sign Out'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
