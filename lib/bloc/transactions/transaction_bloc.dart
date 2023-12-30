import 'package:bloc/bloc.dart';
import 'package:coin_ease/bloc/transactions/transaction_repo.dart';
import 'package:coin_ease/bloc/transactions/transaction_event.dart';
import 'package:coin_ease/bloc/transactions/transaction_state.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:flutter/foundation.dart';

class TransactionBloc extends Bloc<TransactionEvent, Transaction_State> {
  final Transaction_Repository _repository ;

  TransactionBloc(this._repository) : super(LoadingTransactionState()) {
    on<LoadTransactionEvent>((event, emit) async {
      emit(LoadingTransactionState());
      try {
        List<TransactionModel>? records =
            await _repository.getTransactions(event.user);
        if (kDebugMode) {
          print(' Account Data Fetched Successfully: $records');
        }
        emit(LoadedTransactionState(records));
      } catch (e) {
        if (kDebugMode) {
          print('Error fetching Account Data: $e');
        }
        emit(ErrorTransactionState("Failed to load Account Data: $e"));
      }
    });
  }

  @override
  Transaction_State get initialState => LoadingTransactionState();
}
