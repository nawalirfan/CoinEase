import 'package:bloc/bloc.dart';

import 'package:coin_ease/bloc/user/user_event.dart';
import 'package:coin_ease/bloc/user/user_repo.dart';
import 'package:coin_ease/bloc/user/user_state.dart';


class UserBloc extends Bloc<UserEvent, User_State> {
  final User_Repository _repository = User_Repository();

  UserBloc() : super(LoadingUserState()) {
    on<UpdateUserEvent>((event, emit) async {
      emit(LoadingUserState());
      try {
        await _repository.updateUser(
            event.phone, event.mname, event.cnic, event.doi);
        emit(LoadedUserState());
      } catch (e) {
        emit(ErrorUserState("Failed to update Data: $e"));
      }
    });
  }

  @override
  User_State get initialState => LoadingUserState();
}