import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/bloc/user/user_bloc.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider<TransactionBloc>(create: (context) => TransactionBloc()),
          BlocProvider<UserBloc>(create: (context) => UserBloc()),
        ],
        child: MaterialApp(
          // home: SignUpDetails(cu),
          home: (FirebaseAuth.instance.currentUser == null)
              ? const PhoneVerification()
              : SignIn(
                  phoneNumber: FirebaseAuth.instance.currentUser?.phoneNumber),
          debugShowCheckedModeBanner: false,
        ));
  }
}
