import 'package:equatable/equatable.dart';
import 'package:coin_ease/models/transaction_model.dart';

abstract class Transaction_State extends Equatable {
  const Transaction_State();

  @override
  List<Object?> get props => [];
}

class LoadingTransactionState extends Transaction_State {}

class LoadedTransactionState extends Transaction_State {
  final List<TransactionModel>? records;

  LoadedTransactionState(this.records);

  @override
  List<Object?> get props => [records];
}

class ErrorTransactionState extends Transaction_State {
  final String error;

  ErrorTransactionState(this.error);

  @override
  List<Object?> get props => [error];
}
