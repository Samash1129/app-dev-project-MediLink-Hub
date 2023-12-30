import 'package:app_dev_project_medilink_app/screens/authScreens/login_screen.dart';
import 'package:app_dev_project_medilink_app/screens/authScreens/signup_screen.dart';
import 'package:app_dev_project_medilink_app/screens/bloodBank/blood_bank_finder.dart';
import 'package:app_dev_project_medilink_app/screens/emergency/emergency.dart';
import 'package:app_dev_project_medilink_app/screens/findDoctor/find_doctor.dart';
import 'package:app_dev_project_medilink_app/screens/findMedicine/medicine_finder.dart';
import 'package:app_dev_project_medilink_app/screens/firstAid/first_aid.dart';
import 'package:app_dev_project_medilink_app/screens/homePage/home.dart';
import 'package:app_dev_project_medilink_app/screens/hospitalFinder/hospital_finder.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = '/home';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String bloodBankFinder = '/bloodbankfinder';
  static const String firstAid = '/firstaid';
  static const String hospitalFinder = '/hospitalfinder';
  static const String doctorFinder = '/doctorfinder';
  static const String medicineFinder = '/medicinefinder';
  static const String emergency = '/emergency';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      Routes.home: (context) => const HomePage(),
      Routes.login: (context) => const LoginPage(),
      Routes.signup: (context) => const SignUpPage(),
      Routes.bloodBankFinder: (context) => const BloodBankFinder(),
      Routes.firstAid: (context) => FirstAidScreen(),
      Routes.hospitalFinder: (context) => const HospitalFinder(),
      Routes.doctorFinder: (context) => const DoctorFinder(),
      Routes.medicineFinder: (context) => const MedicineFinder(),
      Routes.emergency: (context) => EmergencyScreen(),
    };
  }
}