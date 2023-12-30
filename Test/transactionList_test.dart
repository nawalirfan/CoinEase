import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/test_widgets/transactionList/transactionList_Tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Renders ListView.builder with TransactionTile widgets',
      (WidgetTester tester) async {
    final List<TransactionModel> transactions = [
      TransactionModel(
        id: '1',
        amount: 100.0,
        isDebit: false,
        account: 'Account1',
        accountTo: {'title': 'Receiver'},
        dateTime: Timestamp.now(),
        refNumber: '123456',
      ),
    ];

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView.builder(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              TransactionModel transaction = transactions[index];
              return TransactionTile(
                title: transaction.accountTo['title'] ?? '',
                amount: transaction.amount,
                isDebit: transaction.isDebit,
                dateTime: transaction.dateTime.toDate().toString(),
              );
            },
          ),
        ),
      ),
    );


    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(TransactionTile), findsNWidgets(transactions.length));
  });

}
