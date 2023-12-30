import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/test_widgets/transactionDetail_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coin_ease/models/account_model.dart';
import 'package:coin_ease/models/transaction_model.dart';

void main() {
  testWidgets('TransactionDetailsContainer should display sender information',
      (WidgetTester tester) async {
    UserAccount sender = UserAccount(
      accountNumber: '123456789',
      title: 'Sender Name',
      bankName: 'Sender Bank',
    );

    UserAccount receiver = UserAccount(
      accountNumber: '987654321',
      title: 'Receiver Name',
      bankName: 'Receiver Bank',
    );

    TransactionModel transaction = TransactionModel(
      id: '1',
      amount: 100.0,
      isDebit: true,
      account: '123456789',
      accountTo: {'id': '987654321'},
      dateTime: Timestamp.now(),
      refNumber: 'REF123',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: TransactionDetailsContainer(
          sender: sender,
          receiver: receiver,
          transaction: transaction,
        ),
      ),
    );

    expect(find.text(sender.title!), findsOneWidget);
    expect(find.text(sender.accountNumber!), findsOneWidget);
    expect(find.text(sender.bankName!), findsOneWidget);
  });

  testWidgets('TransactionDetailsContainer should display receiver information',
      (WidgetTester tester) async {
    UserAccount sender = UserAccount(
      accountNumber: '123456789',
      title: 'Sender Name',
      bankName: 'Sender Bank',
    );

    UserAccount receiver = UserAccount(
      accountNumber: '987654321',
      title: 'Receiver Name',
      bankName: 'Receiver Bank',
    );

    TransactionModel transaction = TransactionModel(
      id: '1',
      amount: 100.0,
      isDebit: true,
      account: '123456789',
      accountTo: {'id': '987654321'},
      dateTime: Timestamp.now(),
      refNumber: 'REF123',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: TransactionDetailsContainer(
          sender: sender,
          receiver: receiver,
          transaction: transaction,
        ),
      ),
    );

    expect(find.text(receiver.title!), findsOneWidget);
    expect(find.text(receiver.accountNumber!), findsOneWidget);
    expect(find.text(receiver.bankName!), findsOneWidget);
  });

  testWidgets('TransactionDetailsContainer should display transaction reference number',
      (WidgetTester tester) async {
    UserAccount sender = UserAccount(
      accountNumber: '123456789',
      title: 'Sender Name',
      bankName: 'Sender Bank',
    );

    UserAccount receiver = UserAccount(
      accountNumber: '987654321',
      title: 'Receiver Name',
      bankName: 'Receiver Bank',
    );

    TransactionModel transaction = TransactionModel(
      id: '1',
      amount: 100.0,
      isDebit: true,
      account: '123456789',
      accountTo: {'id': '987654321'},
      dateTime: Timestamp.now(),
      refNumber: 'REF123',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: TransactionDetailsContainer(
          sender: sender,
          receiver: receiver,
          transaction: transaction,
        ),
      ),
    );

    expect(find.text(transaction.refNumber), findsOneWidget);
  });
}
