import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/MyAccount_bloc/my_account_event.dart';
import 'package:coin_ease/bloc/MyAccount_bloc/my_account_state.dart';
import 'package:coin_ease/bloc/MyAccount_bloc/repo.dart';

class ListBloc extends Bloc<AccountDetailEvent, AccountDetailState> {
  final ListRepository _repository = ListRepository();

  ListBloc() : super(AccountDetailLoadingState()) {
    on<LoadDataListEvent>((event, emit) async {
      emit(AccountDetailLoadingState());
      try {
        List<DocumentSnapshot> records = await _repository.getList();
        print(' List Fetched Successfully: $records');
        emit(LoadedState(records));
      } catch (e) {
        print('Error fetching friend list: $e');
        emit(AccountDetailErrorState("Failed to load list: $e"));
      }
    });
  }

  @override
  AccountDetailState get initialState => AccountDetailLoadingState();
}
