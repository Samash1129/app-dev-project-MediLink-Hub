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
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Multiple Device Screenshots', () {
    testGoldens('Device Variation Test', (tester) async {
      await loadAppFonts(); // Load fonts if you have any

      // Define your device configurations
      final devices = [
        const Device(name: 'iPhone11', size: Size(414, 896), devicePixelRatio: 2.0), // iPhone 11
        const Device(name: 'SamsungS10', size: Size(360, 760), devicePixelRatio: 4.0), // Samsung S10
        // ... Add more devices as needed
      ];

      // Define your widget scenarios manually
      final scenarios = [
        {'name': 'Home', 'widget': const HomePage()},
        {'name': 'Login', 'widget': const LoginPage()},
        {'name': 'SignUp', 'widget': const SignUpPage()},
        {'name': 'BloodBankFinder', 'widget': const BloodBankFinder()},
        {'name': 'FirstAid', 'widget': FirstAidScreen()},
        {'name': 'HospitalFinder', 'widget': const HospitalFinder()},
        {'name': 'DoctorFinder', 'widget': const DoctorFinder()},
        {'name': 'MedicineFinder', 'widget': const MedicineFinder()},
        {'name': 'Emergency', 'widget': EmergencyScreen()},
        // ... Add more scenarios as needed
      ];

      // Iterate over each device and scenario combination
      for (final device in devices) {
        for (final scenario in scenarios) {
          // Set up the device environment and widget
          await tester.pumpWidgetBuilder(
            scenario['widget'] as Widget,
            wrapper: (child) => MediaQuery(
              data: MediaQueryData(
                size: device.size,
                devicePixelRatio: device.devicePixelRatio,
              ),
              child: MaterialApp(home: child),
            ),
          );

          // Take the screenshot
          await multiScreenGolden(
            tester,
            '${scenario['name']} on ${device.name}',
            devices: [device],
          );
        }
      }
    });
  });
}