// ignore_for_file: use_build_context_synchronously
import 'package:app_dev_project_medilink_app/functions/authentication.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailControllerProvider = Provider((ref) => TextEditingController());
final passwordControllerProvider = Provider((ref) => TextEditingController());
final formKeyProvider = Provider((ref) => GlobalKey<FormState>());
final authServiceProvider = Provider((ref) => AuthService(ref));

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = ref.watch(emailControllerProvider);
    final passwordController = ref.watch(passwordControllerProvider);
    final formKey = ref.watch(formKeyProvider);
    final authService = ref.read(authServiceProvider);

    Future<void> _signIn() async {
      final form = formKey.currentState!;
      if (form.validate()) {
        try {
          await authService.login(
            email: emailController.text.trim(),
            password: passwordController.text,
          );
          Navigator.popAndPushNamed(context, '/home');
        } catch (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error.toString())),
          );
        }
      }
    }

    Future<void> _signInWithGoogle() async {
      try {
        final GoogleSignIn _googleSignIn = GoogleSignIn();

        final GoogleSignInAccount? googleSignInAccount =
            await _googleSignIn.signIn();
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
        await _firebaseAuth.signInWithCredential(credential);
        print('User signed in with Google successfully!');
        Navigator.popAndPushNamed(context, '/home');
      } catch (error) {
        print('Error signing in with Google: $error');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to sign in with Google. Please try again.'),
          ),
        );
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: CupertinoPageScaffold(
          child: SafeArea(
            child: Center(
              child: Form(
                key: formKey,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Username or Email',
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
                            return 'Please enter a username or email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 5),
                      TextFormField(
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
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 285,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: Colors.redAccent[700],
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              children: [
                                const SizedBox(
                                  height: 35,
                                  child: Text(
                                    'New to MediLink?',
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/signup');
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: SizedBox(
                                      height: 34,
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.redAccent[700],
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CustomButton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        text: "Sign In",
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        radius: 30,
                        onPressed: _signIn,
                        color: Colors.redAccent[700]!.withOpacity(1.0),
                      ),
                      const SizedBox(height: 12),
                      const Text('Or Sign In with',
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
                        onPressed: _signInWithGoogle,
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
