import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/HomePage_bloc/homePage_repo.dart';
import 'package:coin_ease/bloc/HomePage_bloc/home_page_event.dart';
import 'package:coin_ease/bloc/HomePage_bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage_Bloc extends Bloc<HomePageEvent, HomePage_state> {
  final HomePage_Repository _repository = HomePage_Repository();

  HomePage_Bloc() : super(HomePage_LoadingState()) {
    on<LoadHomePageDataEvent>((event, emit) async {
      emit(HomePage_LoadingState());
      try {
        List<DocumentSnapshot> records = await _repository.getList();
        print(' Account Data Fetched Successfully: $records');
        emit(HomePage_LoadedState(records));
      } catch (e) {
        print('Error fetching Account Data: $e');
        emit(HomePage_ErrorState("Failed to load Account Data: $e"));
      }
    });
  }

  @override
  HomePage_state get initialState => HomePage_LoadingState();
}
