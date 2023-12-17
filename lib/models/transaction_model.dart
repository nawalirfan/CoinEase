class TransactionModel {
  final String id;
  final String accountId;
  final double amount;
  final bool isDebit;
  final String accountTo;
  final DateTime dateTime;
  final String refNumber;

  TransactionModel({
    required this.id,
    required this.accountId,
    required this.amount,
    required this.isDebit,
    required this.accountTo,
    required this.dateTime,
    required this.refNumber,
  });
}
