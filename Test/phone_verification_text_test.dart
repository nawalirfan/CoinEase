import 'package:coin_ease/test_widgets/phone_verification_TextFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('PhoneVerificationWidget displays image, title, and description',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PhoneVerificationWidget(),
      ),
    );

    expect(find.byType(Image), findsOneWidget);
    expect(
      find.text('Phone Verification'),
      findsOneWidget,
    );
    expect(
      find.text('Register your phone before getting started!'),
      findsOneWidget,
    );
  });

  testWidgets('PhoneVerificationWidget has correct image size',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PhoneVerificationWidget(),
      ),
    );
    expect(
      find.byType(Image),
      findsOneWidget,
    );

    expect(
      tester.getSize(find.byType(Image)),
      Size(250, 250),
    );
  });
}
