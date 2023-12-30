// import 'package:coin_ease/screens/Send/select_user.dart';
// import 'package:coin_ease/screens/account_details.dart';
// import 'package:coin_ease/screens/admin/dashboard.dart';
// import 'package:coin_ease/screens/auth/Forget_password.dart';
// import 'package:coin_ease/screens/auth/otp_pin.dart';
// import 'package:coin_ease/screens/auth/phone_verification.dart';
// import 'package:coin_ease/screens/auth/sign_in.dart';
// import 'package:coin_ease/screens/auth/sign_up.dart';
// import 'package:coin_ease/screens/home_page.dart';
// import 'package:coin_ease/screens/request/select_user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// var countrycode;
// var phone;
// var routes = {
//   '/SignIn': (BuildContext context) =>
//       (FirebaseAuth.instance.currentUser == null)
//           ? const PhoneVerification()
//           : SignIn(phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber),
//   '/Phone_verification': (BuildContext context) => PhoneVerification(),
//   '/OtpPin': (BuildContext context) =>
//       OtpPin(phoneNumber: countrycode.text + phone),
//   '/SignUp': (BuildContext context) => const SignUpDetails(phoneNumber: ''),
//   '/HomePage': (BuildContext context) => const HomePage(),
//   '/Forget_Password': (BuildContext context) => const ForgetPassword(),
//   '/Account_Details': (BuildContext context) => const AccountDetail(),
//   '/Dashboard': (BuildContext context) => const Dashboard(),
//   '/Request_Money': (BuildContext context) => const RequestMoney(),
//   '/SendMoney': (BuildContext context) => const SendMoney(),
// };
