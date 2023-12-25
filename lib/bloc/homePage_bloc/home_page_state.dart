

import 'package:cloud_firestore/cloud_firestore.dart';

abstract class HomePageState {}

class HomePageLoadingState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  final List<DocumentSnapshot<Object?>> accountData;

  HomePageLoadedState(this.accountData);
}


class HomePageErrorState extends HomePageState {
  final String error;

  HomePageErrorState(this.error);
}

