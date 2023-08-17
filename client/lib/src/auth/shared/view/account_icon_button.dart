import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state_notifier.dart';
import 'package:grpc_streaming/src/auth/sign_out/view/sign_out_page.dart';

class AccountLogoIcon extends ConsumerWidget {
  const AccountLogoIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(authStateProvider).maybeWhen(
          orElse: () => const SizedBox(),
          authenticated: (user) => IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const SignOutPage()),
              );
            },
            icon: const Icon(Icons.person),
          ),
        );
  }
}
