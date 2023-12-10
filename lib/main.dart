import 'package:app_dev_project_medilink_app/src/pages/details.dart';
import 'package:app_dev_project_medilink_app/src/pages/first_aid.dart';
import 'package:app_dev_project_medilink_app/src/pages/home.dart';
import 'package:app_dev_project_medilink_app/src/pages/login_screen.dart';
import 'package:app_dev_project_medilink_app/src/pages/signup_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const LoginPage(),
      // home: const HomePage(),
      // home: const DetailsPage(),
      home: FirstAidScreen(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
