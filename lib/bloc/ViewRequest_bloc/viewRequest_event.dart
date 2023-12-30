
import 'package:equatable/equatable.dart';

abstract class RequestsEvent extends Equatable {
  const RequestsEvent([List props = const []]) : super();
}

class LoadRequestsEvent extends RequestsEvent {
  // final UserModel? user;
  // const LoadRequestsEvent(this.user) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}