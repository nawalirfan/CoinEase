import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_pin_event.dart';
part 'otp_pin_state.dart';

class OtpPinBloc extends Bloc<OtpPinEvent, OtpPinState> {
  OtpPinBloc() : super(OtpPinInitial()) {
    on<OtpPinEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
