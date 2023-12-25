import 'package:coin_ease/models/transaction_model.dart';

abstract class Transaction_State {
  const Transaction_State([List props = const []]) : super();
}

class LoadingTransactionState extends Transaction_State {
  
}

class LoadedTransactionState extends Transaction_State {
  final List<TransactionModel>? records;

  LoadedTransactionState(this.records);
}

class ErrorTransactionState extends Transaction_State {
  final String error;

  ErrorTransactionState(this.error);
}
