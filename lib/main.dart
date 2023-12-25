import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app_dev_project_medilink_app/src/pages/blood_bank_finder.dart';
import 'package:app_dev_project_medilink_app/src/pages/find_a_doctor.dart';
import 'package:app_dev_project_medilink_app/src/pages/first_aid.dart';
import 'package:app_dev_project_medilink_app/src/pages/home.dart';
import 'package:app_dev_project_medilink_app/src/pages/hospital_finder.dart';
import 'package:app_dev_project_medilink_app/src/pages/medicine_finder.dart';
import 'package:app_dev_project_medilink_app/src/pages/login_screen.dart';
import 'package:app_dev_project_medilink_app/src/pages/signup_screen.dart';
import 'package:app_dev_project_medilink_app/src/pages/emergency.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const LoginPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/bloodbankfinder': (context) => const BloodBankFinder(),
        '/firstaid': (context) => FirstAidScreen(),
        '/hospitalfinder': (context) => const HospitalFinder(),
        '/doctorfinder': (context) => const DoctorFinder(),
        '/medicinefinder': (context) => const MedicineFinder(),
        '/emergency': (context) => EmergencyScreen(),
      },
    );
  }
}
