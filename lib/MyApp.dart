// import 'package:coin_ease/bloc/authentication_bloc/authentication_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:practicefinalbloc/bloc/authentication_bloc/authentication_bloc.dart';
// import 'package:practicefinalbloc/bloc/list_grid_bloc/list_grid_bloc.dart'; // Import your FriendListBloc
// import 'package:practicefinalbloc/core/repository/user_repo.dart';
// import 'package:practicefinalbloc/screens/App_View.dart';

// class MyApp extends StatefulWidget {
//   final UserRepository userRepository;

//   const MyApp(this.userRepository, {Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _SignInState();
// }

// class _SignInState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         RepositoryProvider<AuthenticationBloc>(
//           create: (context) => AuthenticationBloc(
//             userRepository: widget.userRepository,
//           ),
//         ),
//         BlocProvider<ListBloc>(
//           create: (context) => ListBloc(),
//         ),
//       ],
//       child:AppView(),
//     );
//   }
// }
