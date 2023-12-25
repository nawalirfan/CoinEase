import 'package:coin_ease/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent([List props = const []]) : super();
}

class LoadUserEvent extends UserEvent {
  final UserModel? user;
  const LoadUserEvent(this.user) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class UpdateUserEvent extends UserEvent {
  final String cnic;
  final String doi;
  final String phone;
  final String mname;

  const UpdateUserEvent(this.cnic, this.doi, this.phone, this.mname) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}
