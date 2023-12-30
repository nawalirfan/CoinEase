import 'package:coin_ease/widgets/countryCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

void main() {
  testWidgets('Renders CustomPhoneField with initial values', (WidgetTester tester) async {

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPhoneField(
            onChanged: (PhoneNumber value) {
            },
            initialCountryCode: 'US',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    expect(find.byType(IntlPhoneField), findsOneWidget);


  });

  testWidgets('Triggers onChanged callback with correct PhoneNumber', (WidgetTester tester) async {
    PhoneNumber? selectedPhoneNumber;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPhoneField(
            onChanged: (PhoneNumber value) {
              selectedPhoneNumber = value;
            },
            initialCountryCode: 'US',
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    await tester.tap(find.byType(IntlPhoneField));
    await tester.pump();


    await tester.enterText(find.byType(TextField), '1234567890');

    await tester.testTextInput.receiveAction(TextInputAction.done);

    await tester.pumpAndSettle();
    expect(selectedPhoneNumber?.completeNumber, '+11234567890');
  });
}
