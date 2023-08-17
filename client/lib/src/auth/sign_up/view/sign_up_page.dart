import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state_notifier.dart';
import 'package:grpc_streaming/src/auth/sign_in/provider/sign_in_state_notifier.dart';
import 'package:grpc_streaming/src/auth/sign_up/provider/sign_up_state_notifier.dart';
import 'package:grpc_streaming/src/auth/sign_up/provider/sign_up_states.dart';

class SignUpPage extends ConsumerStatefulWidget {
  static const route = '/sign-up';

  const SignUpPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  bool isFormValid = false;
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<SignUpState>(
      signUpProvider,
      (previous, next) {
        Future.microtask(() {
          next.maybeWhen(
            orElse: () {},
            signedUp: (user) {
              ref.invalidate(authStateProvider);
              Navigator.of(context).popUntil((r) => r.isFirst);
            },
            error: (message) {
              Flushbar(
                backgroundColor: Theme.of(context).colorScheme.errorContainer,
                margin: const EdgeInsets.all(8.0),
                borderRadius: BorderRadius.circular(8.0),
                flushbarStyle: FlushbarStyle.FLOATING,
                title: 'Error',
                message: message,
                duration: const Duration(seconds: 2),
              ).show(context);
            },
          );
        });
      },
    );

    void signUp() {
      final username = usernameController.text;
      final password = passwordController.text;
      ref.read(signUpProvider.notifier).signUp(username, password);
    }

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        bottom: ref.watch(signInProvider).maybeWhen(
              orElse: () => null,
              loading: () => const PreferredSize(
                preferredSize: Size.fromHeight(4.0),
                child: LinearProgressIndicator(),
              ),
            ),
      ),
      body: Form(
        key: _formKey,
        onChanged: () {
          print(isFormValid);
          if (_formKey.currentState?.validate() ?? false) {
            setState(() {
              isFormValid = true;
            });
          }
        },
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Sign Up',
                  style: textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text('Username'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a username',
                  ),
                  validator: usernameValidator,
                ),
                const SizedBox(height: 16),
                const Text('Password'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a password',
                  ),
                  validator: passwordValidator,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: isFormValid
                      ? () {
                          signUp();
                        }
                      : null,
                  child: const Text('Sign Up'),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? usernameValidator(String? username) {
    if (username == null || username.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }
}
