import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CupertinoPageScaffold(
        child: SafeArea(
          child: Center(
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
                  const TextField(
                    decoration: InputDecoration(
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
                  ),
                  const SizedBox(height: 5),
                  const TextField(
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
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: 285,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.red,
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
                              TextButton(
                                onPressed: () {
                                  print("object");
                                },
                                child: const SizedBox(
                                  height: 34,
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.8,
                    text: "Sign In",
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print("object");
                    },
                    color: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  const Text('Or Sign In with', style: TextStyle(fontSize: 12)),
                  const SizedBox(height: 12),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.8,
                    text: 'Google',
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      print('object');
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
    );
  }
}
