import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomePage_state {}

class HomePage_LoadingState extends HomePage_state {}

class HomePage_LoadedState extends HomePage_state {
  final List<DocumentSnapshot<Object?>> records;

  HomePage_LoadedState(this.records);
}


class HomePage_ErrorState extends HomePage_state {
  final String error;

  HomePage_ErrorState(this.error);
}
