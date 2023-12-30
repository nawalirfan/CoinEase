import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/SendMoney_bloc/sendMoney_repo.dart';
import 'package:coin_ease/bloc/SendMoney_bloc/send_money_event.dart';
import 'package:coin_ease/bloc/SendMoney_bloc/send_money_state.dart';



class SendMoney_Bloc extends Bloc<SendMoney_Event, SendMoney_state> {
  final SendMoney_Repository _repository = SendMoney_Repository();

  SendMoney_Bloc() : super(SendMoney_LoadingState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(SendMoney_LoadingState());
      try {
        List<DocumentSnapshot> records = await _repository.getList();
        print(' Users Data Fetched Successfully for send money: $records');
        emit(SendMoney_LoadedState(records));
      } catch (e) {
        print('Error fetching Users Data for send money: $e');
        emit(SendMoney_ErrorState("Failed to load Users Data for send money: $e"));
      }
    });
  }

  @override
  SendMoney_state get initialState => SendMoney_LoadingState();
}
