import 'package:cloud_firestore/cloud_firestore.dart';

abstract class SendMoney_state {}

class SendMoney_LoadingState extends SendMoney_state {}

class SendMoney_LoadedState extends SendMoney_state {
  final List<DocumentSnapshot<Object?>> records;

  SendMoney_LoadedState(this.records);
}


class SendMoney_ErrorState extends SendMoney_state {
  final String error;

  SendMoney_ErrorState(this.error);
}
