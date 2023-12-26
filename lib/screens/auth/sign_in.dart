import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_bloc.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_event.dart';
import 'package:coin_ease/bloc/Sign_In_Bloc/sign_in_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/screens/auth/Forget_password.dart';
import 'package:coin_ease/screens/home_page.dart';
import 'package:coin_ease/screens/auth/phone_verification.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatelessWidget {
  final String? phoneNumber;

  const SignIn({Key? key, this.phoneNumber = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInBloc(AuthService()),
      child: SignInPage(phoneNumber: phoneNumber),
    );
  }
}

class SignInPage extends StatefulWidget {
  final String? phoneNumber;

  const SignInPage({Key? key, this.phoneNumber}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController passwordController = TextEditingController();
  bool loading = false;
  bool error = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInLoading) {
          setState(() {
            loading = true;
          });
        }
        if (state is SignInSuccess) {
          setState(() {
            loading = false;
          });
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomePage()));
        } else if (state is SignInFailure) {
          setState(() {
            loading = false;
          });
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                    child: Text(
                      'Enter Password',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: colors['primary'],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      style: const TextStyle(
                          fontSize: 18, color: Color.fromARGB(255, 0, 0, 0)),
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        errorText: error ? 'Incorrect Password' : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  SizedBox(
                    width: 420,
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (passwordController.text.isEmpty) {
                            setState(() {
                              error = true;
                            });
                          } else {
                            setState(() {
                              error = false;
                            });
                            print("object");
                            context.read<SignInBloc>().add(
                                  SignInButtonPressed(
                                      password: passwordController.text),
                                );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: colors['primary'],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child: const Text('Continue',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                      ),
                      loading
                          ? const CircularProgressIndicator()
                          : TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PhoneVerification()),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 17, color: colors['primary']),
                              ),
                            ),
                    ],
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPassword()),
                            );
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                                fontSize: 17, color: colors['primary']),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
