import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/widgets/users_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coin_ease/models/user_model.dart';


void main() {
  testWidgets('UserList should render correctly', (WidgetTester tester) async 
  {
    final List<UserModel> mockUsers = 
    [
      UserModel(
        id: '1',
        phoneNumber: '1234567890',
        password: 'password',
        name: 'John Doe',
        cnic: '1234567890123',
        dateOfIssuance: '01/01/2022',
        motherName: 'Jane Doe',
        role: 'user',
        account: UserAccount(
          accountNumber: '12345',
          title: 'Savings',
          balance: 1000.0,
          accountType: 'Savings',
          iban: 'IBAN12345',
          bankName: 'MyBank',
          cardNo: '1234-5678-9012-3456',
          isActive: true,
        ),
      ),
    ];
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: UserList(users: mockUsers, isSend: true),
        ),
      ),
    );


    expect(find.byType(UserList), findsOneWidget);

    expect(find.byType(ListTile), findsNWidgets(mockUsers.length));

    await tester.tap(find.byType(ListTile).first);

    await tester.pumpAndSettle();
  });
}
