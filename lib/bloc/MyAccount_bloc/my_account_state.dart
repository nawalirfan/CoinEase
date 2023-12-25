// states.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:coin_ease/models/account_model.dart';

abstract class AccountDetailState extends Equatable {
  const AccountDetailState();

  @override
  List<Object> get props => [];
}

class AccountDetailInitialState extends AccountDetailState {}

class AccountDetailLoadingState extends AccountDetailState {}

class LoadedState extends AccountDetailState {
  final List<DocumentSnapshot<Object?>> accounts;

  LoadedState(this.accounts);
}

class AccountDetailErrorState extends AccountDetailState {
  final String error;

  const AccountDetailErrorState(this.error);

  @override
  List<Object> get props => [error];
}



