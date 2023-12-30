import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_dev_project_medilink_app/main.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  // Initialize Firebase before running the tests
  setUpAll(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  });
  testWidgets('Login Screen Integration Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the initial screen is the login screen
    expect(find.text('Sign In'), findsOneWidget);

    // Enter invalid credentials and tap on "Sign In"
    await tester.enterText(
        find.byKey(const Key('Email')), 'invalid@example.com');
    await tester.enterText(find.byKey(const Key('Password')), 'wrongpass');
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // Verify that an error message is displayed
    expect(find.text('Email or password may be incorrect.'), findsOneWidget);

    // Enter valid credentials and tap on "Sign In"
    await tester.enterText(
        find.byKey(const Key('Email')), 'admin@medilink.com');
    await tester.enterText(find.byKey(const Key('Password')), 'password');
    await tester.tap(find.text('Sign In'));
    await tester.pumpAndSettle();

    // Verify that the app navigates to the home screen
    expect(find.text('MediLink Hub'), findsOneWidget);
  });
}
