import 'package:coin_ease/models/user_model.dart';

abstract class User_State {
  const User_State([List props = const []]) : super();
}

class LoadingUserState extends User_State {
  
}

class LoadedUserState extends User_State {
}

class ErrorUserState extends User_State {
  final String error;

  ErrorUserState(this.error);
}
