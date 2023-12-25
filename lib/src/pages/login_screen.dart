import 'package:app_dev_project_medilink_app/functions/googleSignIn.dart';
import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import 'package:app_dev_project_medilink_app/functions/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthService _authService = AuthService();

  Future<void> _signIn() async {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      final String? errorMessage = await _authService.login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (errorMessage == null) {
        // Login success
        print('User logged in successfully!');
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Login failed
        print('Failed to log in: $errorMessage');
        // Show a SnackBar with the error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: CupertinoPageScaffold(
          child: SafeArea(
            child: Center(
              child: Form(
                key: _formKey,
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
                        controller: _emailController,
                        decoration: InputDecoration(
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
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
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
                        onPressed: () async {
                          try {
                            // Call the signInWithGoogle function
                            UserCredential userCredential =
                                await GoogleSingIn().signInWithGoogle();

                            // Access user information if needed
                            User user = userCredential.user!;
                            print('Signed in with Google: ${user.displayName}');
                            Navigator.popAndPushNamed(context, '/home');
                          } catch (e) {
                            print('Error signing in with Google: $e');
                          }
                        },
                        color: Colors.white60,
                        imageAssetPath: 'assets/google.png',
                      ),
                      const SizedBox(height: 5),
                      CustomButton(
                        width: MediaQuery.of(context).size.width * 0.8,
                        text: 'Facebook',
                        textStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                        radius: 30,
                        onPressed: () {
                          print("object");
                        },
                        color: Colors.blue,
                        imageAssetPath: 'assets/facebook1.png',
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
