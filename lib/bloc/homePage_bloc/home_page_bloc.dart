import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/homePage_bloc/home_page_event.dart';
import 'package:coin_ease/bloc/homePage_bloc/home_page_state.dart';
import 'package:coin_ease/bloc/homePage_bloc/repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<HomePageEvent, HomePageState> {
  final HomePageRepository _repository = HomePageRepository();

  ListBloc() : super(HomePageLoadingState()) {
    on<LoadDataEvent>((event, emit) async {
      emit(HomePageLoadingState());
      try {
        List<DocumentSnapshot> records = await _repository.getList();
        print(' Data Fetched Successfully: $records');
        emit(HomePageLoadedState(records));
      } catch (e) {
        print('Error fetching Data: $e');
        emit(HomePageErrorState("Failed to load Data: $e"));
      }
    });
  }

  @override
  HomePageLoadingState get initialState => HomePageLoadingState();
}
