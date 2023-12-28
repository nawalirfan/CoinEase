import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/ViewRequest_bloc/viewRequest_repo.dart';
import 'package:coin_ease/bloc/ViewRequest_bloc/viewRequest_event.dart';
import 'package:coin_ease/bloc/ViewRequest_bloc/viewRequest_state.dart';
import 'package:coin_ease/models/request_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:flutter/foundation.dart';


class RequestsBloc extends Bloc<RequestsEvent, RequestState> {
  final RequestsRepository _repository = RequestsRepository();

  RequestsBloc() : super(RequestLoadingState()) {
    on<LoadRequestsEvent>((event, emit) async {
      emit(RequestLoadingState());
      try {
        List<DocumentSnapshot> records = await _repository.getList();
        print(' Account Data Fetched Successfully: $records');
        emit(RequestLoadedState(records.cast<RequestModel>()));
      } catch (e) {
        print('Error fetching Account Data: $e');
        emit(RequestErrorState("Failed to load Account Data: $e"));
      }
    });
  }

  @override
  RequestState get initialState => RequestLoadingState();
}