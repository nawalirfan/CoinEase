import 'package:coin_ease/test_widgets/signUp/signUpForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Verify UI elements and error message', (WidgetTester tester) async {
  
    final nameController = TextEditingController();
    final cnicController = TextEditingController();
    final dateController = TextEditingController();
    final mNameController = TextEditingController();
    final passwordController = TextEditingController();
    final cPasswordController = TextEditingController();


    final errors = true;
    final passError = true;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SignUpForm(
            nameController: nameController,
            cnicController: cnicController,
            dateController: dateController,
            mNameController: mNameController,
            passwordController: passwordController,
            cPasswordController: cPasswordController,
            errors: errors,
            passError: passError,
          ),
        ),
      ),
    );

    //presence of key UI elements
    expect(find.text('Sign Up'), findsOneWidget);
    expect(find.text('Please fill all the fields correctly'), findsOneWidget);
    expect(find.text('Name:'), findsOneWidget);
    expect(find.text('CNIC Number:'), findsOneWidget);
    expect(find.text('Date of Issuance (CNIC):'), findsOneWidget);
    expect(find.text('Mother\'s Name:'), findsOneWidget);
    expect(find.text('Password:'), findsOneWidget);
    expect(find.text('Confirm Password:'), findsOneWidget);
  });

  testWidgets('Verify text input fields', (WidgetTester tester) async {
    final nameController = TextEditingController();
    final cnicController = TextEditingController();
    final dateController = TextEditingController();
    final mNameController = TextEditingController();
    final passwordController = TextEditingController();
    final cPasswordController = TextEditingController();

    final errors = false;
    final passError = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SignUpForm(
            nameController: nameController,
            cnicController: cnicController,
            dateController: dateController,
            mNameController: mNameController,
            passwordController: passwordController,
            cPasswordController: cPasswordController,
            errors: errors,
            passError: passError,
          ),
        ),
      ),
    );

    // Enter text in the input fields
    await tester.enterText(find.byType(TextField).at(0), 'John Doe');
    await tester.enterText(find.byType(TextField).at(1), '1234567890123');
    await tester.enterText(find.byType(TextField).at(2), '01/01/2023');
    await tester.enterText(find.byType(TextField).at(3), 'Jane Doe');
    await tester.enterText(find.byType(TextField).at(4), 'password');
    await tester.enterText(find.byType(TextField).at(5), 'password');

    // Verify the entered text
    expect(nameController.text, 'John Doe');
    expect(cnicController.text, '1234567890123');
    expect(dateController.text, '01/01/2023');
    expect(mNameController.text, 'Jane Doe');
    expect(passwordController.text, 'password');
    expect(cPasswordController.text, 'password');
  });
}
