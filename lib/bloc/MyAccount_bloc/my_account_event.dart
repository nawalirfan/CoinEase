// events.dart
import 'package:equatable/equatable.dart';
import 'package:coin_ease/models/account_model.dart';

// abstract class AccountDetailEvent extends Equatable {
//   const AccountDetailEvent();

//   @override
//   List<Object> get props => [];
// }

// class FetchAccountDetailEvent extends AccountDetailEvent {
//   final String accountId; // Change this to the appropriate type

//   const FetchAccountDetailEvent(this.accountId);

//   @override
//   List<Object> get props => [accountId];
// }



abstract class AccountDetailEvent extends Equatable {}

class LoadDataListEvent extends AccountDetailEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

