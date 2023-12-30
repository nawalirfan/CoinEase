import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/bloc/transactions/transaction_repo.dart';
import 'package:coin_ease/bloc/user/user_bloc.dart';
import 'package:coin_ease/screens/Send/select_user.dart';
import 'package:coin_ease/screens/account_details.dart';
import 'package:coin_ease/screens/admin/dashboard.dart';
import 'package:coin_ease/screens/auth/Forget_password.dart';
import 'package:coin_ease/screens/auth/otp_pin.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:coin_ease/screens/auth/sign_up.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/screens/request/select_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Transaction_Repository transaction_repository = Transaction_Repository();
    var countrycode;
    var phone;
    return MultiBlocProvider(
        providers: [
          BlocProvider<TransactionBloc>(
              create: (context) => TransactionBloc(transaction_repository)),
          BlocProvider<UserBloc>(create: (context) => UserBloc()),
        ],
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/SignIn',

            routes: {
              '/SignIn': (BuildContext context) =>
                  (FirebaseAuth.instance.currentUser == null)
                      ? const PhoneVerification()
                      : SignIn( phoneNumber:FirebaseAuth.instance.currentUser?.phoneNumber),
              '/Phone_verification': (BuildContext context) => PhoneVerification(),
              '/OtpPin': (BuildContext context) => OtpPin(phoneNumber: countrycode.text + phone),
              '/SignUp': (BuildContext context) => const SignUpDetails(phoneNumber: '',),
              '/HomePage': (BuildContext context) => const HomePage(),
              '/Forget_Password': (BuildContext context) => const ForgetPassword(),
              '/Account_Details': (BuildContext context) =>const AccountDetail(),
              '/Dashboard': (BuildContext context) => const Dashboard(),
              '/Request_Money': (BuildContext context) => const RequestMoney(),
              '/SendMoney': (BuildContext context) => const SendMoney(),

              // //home:  SignUpDetails(phoneNumber: '',),
              // home: (FirebaseAuth.instance.currentUser == null)
              //     ? const PhoneVerification()
              //     : SignIn(
              //         phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber),
            }));
  }
}
