

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/my_account_bloc/my_account_event.dart';

import 'package:coin_ease/bloc/my_account_bloc/my_account_state.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_repo.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_event.dart';
import 'package:coin_ease/bloc/transaction_detail_bloc/transaction_detail_state.dart';




class transactionDetail_Bloc extends Bloc<transactionDetailEvent, transactionDetail_State> {
  final transactionDetail_Repository _repository = transactionDetail_Repository();

  transactionDetail_Bloc() : super(transaction_loadingState()) {
    on<LoadDataEvents>((event, emit) async {
      emit(transaction_loadingState());
      try {
        List<DocumentSnapshot> transactions = await _repository.getList();
        print(' transaction Data Fetched Successfully: $transactions');
        emit(transaction_LoadedState(transactions));
      } catch (e) {
        print('Error fetching transaction Data: $e');
        emit(transaction_ErrorState("Failed to load transaction Data: $e"));
      }
    });
  }

  @override
  AccountDetail_State get initialState => LoadingState();
}
