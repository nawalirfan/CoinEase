import 'package:coin_ease/test_widgets/UserInfoWidget_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coin_ease/models/account_model.dart';

void main() {
  group('UserInfoWidget Tests', () {
    // Test case 1: Widget creation and text content
    testWidgets('Widget creation and text content',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: UserInfoWidget(
            userName: 'John Doe',
            userAccount: UserAccount(balance: 1000.0, accountType: 'visa'),
            obscureText: false,
            onToggleVisibility: () {},
          ),
        ),
      );
      expect(find.text('John Doe'), findsOneWidget);
      expect(find.text('Current Balance'), findsOneWidget);
      expect(find.text('Rs. 1000.00'), findsOneWidget);
    });

    // Test case 2: Visibility toggle callback
    testWidgets('Visibility toggle callback', (WidgetTester tester) async {
      bool obscureText = false;
      await tester.pumpWidget(
        MaterialApp(
          home: UserInfoWidget(
            userName: 'John Doe',
            userAccount: UserAccount(balance: 1000.0, accountType: 'visa'),
            obscureText: obscureText,
            onToggleVisibility: () {
              obscureText = !obscureText;
            },
          ),
        ),
      );
      expect(obscureText, isFalse);
      await tester.tap(find.byIcon(Icons.remove_red_eye_outlined));
      await tester.pump();

      expect(obscureText, isTrue);
    });
  });
}
