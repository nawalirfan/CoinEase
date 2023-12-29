
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class BNavBar_test extends NavigatorObserver {
  final List<NavigatorAction> actions = [];

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    actions.add(NavigatorAction.pop);
    super.didPop(route, previousRoute);
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    actions.add(NavigatorAction.push);
    super.didPush(route, previousRoute);
  }
}

enum NavigatorAction { push, pop }

void main() {
  testWidgets('BNavBar should build', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BNavBar(index: 1),
      ),
    ));

    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('BNavBar should have correct colors', (WidgetTester tester) async {
  
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BNavBar(index: 1),
      ),
    ));

  
    expect(
      tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar)).backgroundColor,
      colors['secondary'],
    );

    expect(
      tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar)).selectedItemColor,
      colors['primary'],
    );

    expect(
      tester.widget<BottomNavigationBar>(find.byType(BottomNavigationBar)).unselectedItemColor,
      const Color.fromARGB(255, 105, 104, 105),
    );
  });
}
