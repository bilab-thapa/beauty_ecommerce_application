import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:beauty_e_commerce/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Whole App Teting', () {
    testWidgets('Verify Steps', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      // Verify the counter starts at 0.
      expect(find.text('Continue'), findsOneWidget);
      // Finds the floating action button to tap on.
      final Finder continueButton = find.byType(TextButton);
      // Emulate a tap on the floating action button.
      await tester.tap(continueButton);
      // Trigger a frame.
      await tester.pumpAndSettle();
      //login screen
      final emailField = find.ancestor(
        of: find.text('Email'),
        matching: find.byType(TextFormField),
      );
      final passwordField = find.ancestor(
        of: find.text('Password'),
        matching: find.byType(TextFormField),
      );
      tester.enterText(emailField, "bilab@bilab.com");
      tester.enterText(passwordField, "bilab123");

      //tap login
      final Finder loginButton = find.byType(TextButton);
      await tester.tap(loginButton);
      // Verify the counter increments by 1.
      expect(find.text('Login'), findsOneWidget);
    });
  });
}
