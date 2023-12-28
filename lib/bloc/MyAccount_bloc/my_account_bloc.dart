import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/MyAccount_bloc/my_account_event.dart';
import 'package:coin_ease/bloc/MyAccount_bloc/my_account_state.dart';
import 'package:coin_ease/bloc/MyAccount_bloc/mu_account-repo.dart';

class AccountDetail_Bloc extends Bloc<AccountDetailEvent, AccountDetail_State> {
  final AccountDetail_Repository _repository = AccountDetail_Repository();

  AccountDetail_Bloc() : super(LoadingState()) {
    on<LoadDataListEvent>((event, emit) async {
      emit(LoadingState());
      try {
        List<DocumentSnapshot> records = await _repository.getList();
        print(' Account Data Fetched Successfully: $records');
        emit(LoadedState(records));
      } catch (e) {
        print('Error fetching Account Data: $e');
        emit(ErrorState("Failed to load Account Data: $e"));
      }
    });
  }

  @override
  AccountDetail_State get initialState => LoadingState();
}
