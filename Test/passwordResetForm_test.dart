import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coin_ease/widgets/passwordResetForm.dart';

void main() {
  testWidgets('Valid Input Test', (WidgetTester tester) async {
    void forgetPasswordFunction(String cnic, String password) {}
    bool cnicError = false;

    final widget = PasswordResetForm(
      forgetPasswordFunction: forgetPasswordFunction,
      cnicError: cnicError,
    );

    // Create a TestWidgetsFlutterBinding to run the test
    await tester.pumpWidget(MaterialApp(home: widget));

    // Enter valid CNIC, password, and confirm password
    await tester.enterText(find.byType(TextField).at(0), '1234567890');
    await tester.enterText(find.byType(TextField).at(1), 'password');
    await tester.enterText(find.byType(TextField).at(2), 'password');

    //Continue button
    await tester.tap(find.text('Continue'));
    await tester.pump();

    // Expecting no error messages
    expect(find.text('CNIC number is required'), findsNothing);
    expect(find.text('Password is required'), findsNothing);
    expect(find.text('Confirm Password is required'), findsNothing);
    expect(find.text('Passwords don\'t match'), findsNothing);
  });
  testWidgets('Empty CNIC Test', (WidgetTester tester) async {
    // mock for forgetPassword props
    void forgetPasswordFunction(String cnic, String password) {}
    bool cnicError = false;

    // mock for pass reset 
    final widget = PasswordResetForm(
      forgetPasswordFunction: forgetPasswordFunction,
      cnicError: cnicError,
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

    // Expecting error for cnic
    expect(find.text('CNIC number is required'), findsOneWidget);
  });

  testWidgets('Passwords Mismatch Test', (WidgetTester tester) async {    
    void forgetPasswordFunction(String cnic, String password) {}
    bool cnicError = false;

    final widget = PasswordResetForm(
      forgetPasswordFunction: forgetPasswordFunction,
      cnicError: cnicError,
    );

    await tester.pumpWidget(MaterialApp(home: widget));

    await tester.enterText(find.byType(TextField).at(0), '1234567890');
    await tester.enterText(find.byType(TextField).at(1), 'password1');
    await tester.enterText(find.byType(TextField).at(2), 'password2');

    await tester.tap(find.text('Continue'));
    await tester.pump();

    expect(find.text('Passwords don\'t match'), findsOneWidget);
  });
}
