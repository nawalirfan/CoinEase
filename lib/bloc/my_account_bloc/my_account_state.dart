

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class AccountDetail_State {}

class LoadingState extends AccountDetail_State {}

class LoadedState extends AccountDetail_State {
  final List<DocumentSnapshot<Object?>> records;

  LoadedState(this.records);
}


class ErrorState extends AccountDetail_State {
  final String error;

  ErrorState(this.error);
}

