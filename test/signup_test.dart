import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_dev_project_medilink_app/main.dart';

void main() {
  testWidgets('Signup Page Integration Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the initial screen is the signup screen
    expect(find.text('Sign Up'), findsOneWidget);

    // Enter invalid credentials and tap on "Sign Up"
    await tester.enterText(find.byKey(const Key('Username')), 'TestUser');
    await tester.enterText(
        find.byKey(const Key('Email')), 'invalid@example.com');
    await tester.enterText(find.byKey(const Key('Password')), 'password');
    await tester.enterText(
        find.byKey(const Key('confirmPasswordController')), 'wrongpass');
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify that an error message is displayed
    expect(find.text('Passwords do not match'), findsOneWidget);

    // Enter valid credentials and tap on "Sign Up"
    await tester.enterText(find.byKey(const Key('usernameField')), 'TestUser');
    await tester.enterText(
        find.byKey(const Key('emailField')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('passwordField')), 'password');
    await tester.enterText(
        find.byKey(const Key('confirmPasswordField')), 'password');
    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    // Verify that the app navigates to the home screen
    expect(find.text('MediLink Hub'), findsOneWidget);
  });
}
