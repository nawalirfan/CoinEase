import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coin_ease/test_widgets/passwordResetForm.dart';

void main() {
  testWidgets('Valid Input Test', (WidgetTester tester) async {
    // Create a mock function for the forgetPasswordFunction
    void forgetPasswordFunction(String cnic, String password) {}

    // Create a PasswordResetForm widget with the mock function
    final widget = PasswordResetForm(
      forgetPasswordFunction: forgetPasswordFunction,
    );

    // Create a TestWidgetsFlutterBinding to run the test
    await tester.pumpWidget(MaterialApp(home: widget));

    // Enter valid CNIC, password, and confirm password
    await tester.enterText(find.byType(TextField).at(0), '1234567890');
    await tester.enterText(find.byType(TextField).at(1), 'password');
    await tester.enterText(find.byType(TextField).at(2), 'password');

    // Tap the Continue button
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Expect that there are no error messages
    expect(find.text('CNIC number is required'), findsNothing);
    expect(find.text('Password is required'), findsNothing);
    expect(find.text('Confirm Password is required'), findsNothing);
    expect(find.text('Confirm Passwords don\'t match'), findsNothing);
  });
  testWidgets('Empty CNIC Test', (WidgetTester tester) async {
  // Create a mock function for the forgetPasswordFunction
  void forgetPasswordFunction(String cnic, String password) {}

  // Create a PasswordResetForm widget with the mock function
  final widget = PasswordResetForm(
    forgetPasswordFunction: forgetPasswordFunction,
  );

  // Create a TestWidgetsFlutterBinding to run the test
  await tester.pumpWidget(MaterialApp(home: widget));

  // Enter empty CNIC
  await tester.enterText(find.byType(TextField).at(0), '');
  await tester.enterText(find.byType(TextField).at(1), 'password');
  await tester.enterText(find.byType(TextField).at(2), 'password');

  // Tap the Continue button
  await tester.tap(find.text('Continue'));
  await tester.pump();

  // Expect an error message for empty CNIC
  expect(find.text('CNIC number is required'), findsOneWidget);
});

testWidgets('Passwords Mismatch Test', (WidgetTester tester) async {
  // Create a mock function for the forgetPasswordFunction
  void forgetPasswordFunction(String cnic, String password) {}

  // Create a PasswordResetForm widget with the mock function
  final widget = PasswordResetForm(
    forgetPasswordFunction: forgetPasswordFunction,
  );

  // Create a TestWidgetsFlutterBinding to run the test
  await tester.pumpWidget(MaterialApp(home: widget));

  // Enter valid CNIC and mismatched passwords
  await tester.enterText(find.byType(TextField).at(0), '1234567890');
  await tester.enterText(find.byType(TextField).at(1), 'password1');
  await tester.enterText(find.byType(TextField).at(2), 'password2');

  // Tap the Continue button
  await tester.tap(find.text('Continue'));
  await tester.pump();

  // Expect an error message for mismatched passwords
  expect(find.text('Confirm Passwords don\'t match'), findsOneWidget);
});


  
}
