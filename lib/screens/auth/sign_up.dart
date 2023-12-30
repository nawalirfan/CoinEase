import 'package:coin_ease/widgets/signUpForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_ease/bloc/signup_bloc/sign_up_bloc.dart';
import 'package:coin_ease/bloc/signup_bloc/sign_up_event.dart';
import 'package:coin_ease/bloc/signup_bloc/sign_up_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/auth/sign_in.dart';
import 'package:coin_ease/services/auth_service.dart';

class SignUpDetails extends StatefulWidget {
  final String phoneNumber;
  const SignUpDetails({super.key, required this.phoneNumber});

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

class _SignUpDetailsState extends State<SignUpDetails> {
  TextEditingController nameController = TextEditingController();
  TextEditingController cnicController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController mNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  bool passError = false;
  bool errors = false;

  final AuthService _authService = AuthService();

  Future<bool> saveUser() async {
    if (passwordController.text == cPasswordController.text) {
      UserModel user = UserModel(
          id: '',
          phoneNumber: widget.phoneNumber,
          password: passwordController.text,
          name: nameController.text,
          cnic: cnicController.text,
          dateOfIssuance: dateController.text,
          motherName: mNameController.text,
          role: 'user');

      bool isRegistered = await _authService.register(user);
      return isRegistered;
    } else {
      print('plz enter same passwords');
      setState(() {
        passError = true;
      });
      setState(() {
        errors = true;
      });
      return false;
    }
  }

  void navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SignUpBloc(),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              navigate();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              leading: const Icon(Icons.arrow_back),
              title: const Text('Personal Details'),
            ),
            body: BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SignUpFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Error: Sign up failed'),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 30, right: 30, left: 30),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SignUpForm(  //widget
                            nameController: nameController,
                            cnicController: cnicController,
                            dateController: dateController,
                            mNameController: mNameController,
                            passwordController: passwordController,
                            cPasswordController: cPasswordController,
                            errors: errors,
                            passError: passError,
                          ),
                          const SizedBox(height: 40),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (passwordController.text ==
                                          cPasswordController.text &&
                                      passwordController.text.isNotEmpty &&
                                      cPasswordController.text.isNotEmpty &&
                                      nameController.text.isNotEmpty &&
                                      cnicController.text.isNotEmpty &&
                                      dateController.text.isNotEmpty &&
                                      mNameController.text.isNotEmpty) {
                                    setState(() {
                                      errors = false;
                                    });
                                    context.read<SignUpBloc>().add(
                                        SignUpButtonPressed(
                                            id: '',
                                            phoneNumber: widget.phoneNumber,
                                            password: passwordController.text,
                                            name: nameController.text,
                                            cnic: cnicController.text,
                                            dateOfIssuance: dateController.text,
                                            motherName: mNameController.text));
                                  } else {
                                    setState(() {
                                      errors = true;
                                    });
                                  }
                                  // if (state is SignUpSuccess) navigate();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Register',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(Icons.arrow_forward)
                                  ],
                                )),
                          )
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }
}
