import 'package:coin_ease/models/request_model.dart';
abstract class RequestState {
  const RequestState([List props = const []]) : super();
}

class RequestLoadingState extends RequestState {
  
}

class RequestLoadedState extends RequestState {
  final List<RequestModel>? records;

  RequestLoadedState(this.records);
}

class RequestErrorState extends RequestState {
  final String error;

  RequestErrorState(this.error);
}
