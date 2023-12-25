import 'package:coin_ease/models/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class TransactionEvent extends Equatable {
  const TransactionEvent([List props = const []]) : super();
}

class LoadTransactionEvent extends TransactionEvent {
  final UserModel? user;
  const LoadTransactionEvent(this.user) : super();

  @override
  List<Object?> get props => throw UnimplementedError();
}

