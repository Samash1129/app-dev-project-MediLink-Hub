import 'package:app_dev_project_medilink_app/src/widgets/CustomButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
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
                    "Sign Up",
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
                    decoration: InputDecoration(
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
                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                      )),
                  CustomButton(
                    width: MediaQuery.of(context).size.width * 0.8,
                    text: "Sign Up",
                    textStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                    radius: 30,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, '/home');
                    },
                    color: Colors.redAccent[700]!.withOpacity(1.0),
                  ),
                  const SizedBox(height: 12),
                  const Text('Or Sign Up with', style: TextStyle(fontSize: 12)),
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
    );
  }
}
