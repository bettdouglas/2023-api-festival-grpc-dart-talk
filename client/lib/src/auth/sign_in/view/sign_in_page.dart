import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_streaming/src/auth/provider/auth_state_notifier.dart';
import 'package:grpc_streaming/src/auth/sign_in/provider/sign_in_state_notifier.dart';
import 'package:grpc_streaming/src/auth/sign_in/provider/sign_in_states.dart';
import 'package:grpc_streaming/src/auth/sign_up/view/sign_up_page.dart';

class SignInPage extends ConsumerStatefulWidget {
  static const route = '/sign-in';

  const SignInPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends ConsumerState<SignInPage> {
  bool isFormValid = false;
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginState>(
      signInProvider,
      (previous, next) {
        Future.microtask(() {
          next.maybeWhen(
            orElse: () {},
            loggedIn: (user) {
              ref.invalidate(authStateProvider);
              Navigator.of(context).pop();
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

    void signIn() {
      final username = usernameController.text;
      final password = passwordController.text;
      ref.read(signInProvider.notifier).login(username, password);
    }

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        // title: const Text('Sign In'),
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.login),
        ),
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
                  'Sign In',
                  style: textTheme.headlineLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const Text('Username'),
                const SizedBox(height: 8),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your username',
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
                    hintText: 'Enter your password',
                  ),
                  validator: passwordValidator,
                ),
                // const SizedBox(height: 16),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: <Widget>[
                //     Text(
                //       'No account?',
                //       style: textTheme.bodyLarge,
                //     ),
                //     TextButton(
                //       onPressed: () {},
                //       child: const Text('Make account'),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: isFormValid
                      ? () {
                          signIn();
                        }
                      : null,
                  child: const Text('Sign In'),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'No account?',
                      style: textTheme.bodyLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text('Make account'),
                    ),
                  ],
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
      return 'Please enter your username';
    }
    return null;
  }

  String? passwordValidator(String? password) {
    if (password == null || password.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
}
