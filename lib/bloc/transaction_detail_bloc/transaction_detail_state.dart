

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class transactionDetail_State {}

class transaction_loadingState extends transactionDetail_State {}

class transaction_LoadedState extends transactionDetail_State {
  final List<DocumentSnapshot<Object?>> transactionDetail;

  transaction_LoadedState(this.transactionDetail);
}


class transaction_ErrorState extends transactionDetail_State {
  final String error;

  transaction_ErrorState(this.error);
}

