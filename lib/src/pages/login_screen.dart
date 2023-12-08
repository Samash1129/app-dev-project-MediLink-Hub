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
    return const Scaffold(
      body: CupertinoPageScaffold(
        child: SafeArea(
          child: Center(
            child: SizedBox(
              height: 300,
              width: 280,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
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
                  SizedBox(height: 5),
                  TextField(
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
                  SizedBox(height: 10),
                  SizedBox(
                    width: 275,
                      child: Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.red),
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
