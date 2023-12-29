import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coin_ease/screens/Send/select_user.dart';
import 'package:coin_ease/screens/request/select_user.dart';
import 'package:coin_ease/test_widgets/actionButtonRow_homePage.dart';

void main() {
  testWidgets('ActionButtonsRow renders correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ActionButtonsRow(),
        ),
      ),
    );

    //the icons are present for not
    expect(find.byIcon(Icons.send), findsOneWidget);
    expect(find.byIcon(Icons.arrow_downward), findsOneWidget);
    expect(find.byIcon(Icons.sticky_note_2_outlined), findsOneWidget);

    expect(find.text('Send'), findsOneWidget);
    expect(find.text('Request'), findsOneWidget);
    expect(find.text('Bills'), findsOneWidget);
  });
}
