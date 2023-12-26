// ignore_for_file: use_build_context_synchronously

import 'package:app_dev_project_medilink_app/functions/authentication.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider((ref) => AuthService(ref));

final usernameControllerProvider = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

final emailControllerProvider = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

final passwordControllerProvider = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

final confirmPasswordControllerProvider = StateProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

final formKeyProvider = StateProvider<GlobalKey<FormState>>(
  (ref) => GlobalKey<FormState>(),
);

class SignUpPage extends ConsumerWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authService = ref.watch(authServiceProvider);
    final usernameController = ref.watch(usernameControllerProvider);
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final confirmPasswordController =
        ref.watch(confirmPasswordControllerProvider);
    final formKey = ref.watch(formKeyProvider);

    Future<void> _signUp() async {
      final form = formKey.currentState;
      if (form != null && form.validate()) {
        final String? errorMessage = await authService.signup(
          username: usernameController.text.trim(),
          email: emailController.text.trim(),
          password: passwordController.text,
        );

        if (errorMessage == null) {
          // Signup success
          print('User signed up successfully!');
          Navigator.popAndPushNamed(context, '/home');
        } else {
          // Signup failed
          print('Failed to sign up: $errorMessage');
          // Show a SnackBar with the error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(errorMessage),
            ),
          );
        }
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: CupertinoPageScaffold(
          child: SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 90),
                      const Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            prefixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Icon(
                                Icons.person_outline,
                                size: 30,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            prefixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Icon(
                                Icons.email_outlined,
                                size: 30,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Password',
                            prefixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Icon(
                                Icons.lock_outlined,
                                size: 30,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Confirm Password',
                            prefixIcon: Padding(
                              padding: EdgeInsets.fromLTRB(0, 8, 20, 8),
                              child: Icon(
                                Icons.lock_outlined,
                                size: 30,
                              ),
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 285,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  height: 35,
                                  child: Text(
                                    'Already have an Account?',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/login');
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: SizedBox(
                                      height: 34,
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(
                                          color: Colors.redAccent[700],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        text: "Sign Up",
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        radius: 30,
                        onPressed: _signUp,
                        color: Colors.redAccent[700]!.withOpacity(1.0),
                      ),
                      const SizedBox(height: 12),
                      const Text('Or Sign Up with',
                          style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 12),
                      CustomButton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        text: 'Google',
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        radius: 30,
                        onPressed: () {
                          print('object');
                        },
                        color: Colors.white60,
                        imageAssetPath: 'assets/google.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
