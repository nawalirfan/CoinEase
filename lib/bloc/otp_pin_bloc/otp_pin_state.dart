part of 'otp_pin_bloc.dart';

sealed class OtpPinState extends Equatable {
  const OtpPinState();
  
  @override
  List<Object> get props => [];
}

final class OtpPinInitial extends OtpPinState {}
