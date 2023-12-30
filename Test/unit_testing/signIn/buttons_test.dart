import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Verify "Sign Up" and "Forgot Password" links', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AuthLinksRow(),
        ),
      ),
    );

    expect(find.text("Don't have an account?"), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
  });

  testWidgets('Tap "Sign Up" link', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AuthLinksRow(),
        ),
      ),
    );

    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();
    expect(find.byType(PhoneVerification), findsOneWidget);
  });
}
