import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/widgets/transactionDetail_Column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('TransactionDetailWidget displays transaction details correctly',
      (WidgetTester tester) async {
    // Create test data
    final TransactionModel transaction = TransactionModel(
      id: '1',
      amount: 100.0,
      isDebit: false,
      account: '123456789',
      accountTo: {'id': 'receiver_id', 'title': 'Receiver'},
      dateTime: Timestamp.now(),
      refNumber: 'REF123',
    );

    final UserAccount sender = UserAccount(
      accountNumber: '987654321',
      title: 'Sender',
      balance: 500.0,
      accountType: 'Checking',
      iban: 'IBAN123',
      bankName: 'Bank A',
      cardNo: '1234 5678 9012 3456',
      isActive: true,
    );

    final UserAccount receiver = UserAccount(
      accountNumber: '123456789',
      title: 'Receiver',
      balance: 700.0,
      accountType: 'Savings',
      iban: 'IBAN456',
      bankName: 'Bank B',
      cardNo: '9876 5432 1098 7654',
      isActive: true,
    );


    await tester.pumpWidget(
      MaterialApp(
        home: TransactionDetailColumn(
          transaction: transaction,
          sender: sender,
          receiver: receiver,
        ),
      ),
    );
    debugDumpApp();
    await tester.pumpAndSettle();

    //expect(find.text('Rs. + 100.0'), findsOneWidget);
    expect(find.text('Sender'), findsOneWidget);
    expect(find.text('to'), findsOneWidget);
    expect(find.text('Receiver'), findsOneWidget);
  });
}
