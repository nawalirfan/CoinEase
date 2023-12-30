import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_ease/bloc/ViewRequest_bloc/viewRequest_repo.dart';
import 'package:coin_ease/bloc/ViewRequest_bloc/viewRequest_bloc.dart';
import 'package:coin_ease/bloc/ViewRequest_bloc/viewRequest_event.dart';
import 'package:coin_ease/bloc/ViewRequest_bloc/viewRequest_state.dart';
import 'package:coin_ease/colors.dart';
import 'package:coin_ease/models/request_model.dart';
import 'package:coin_ease/models/user_model.dart';
import 'package:coin_ease/screens/request/request_detail.dart';
import 'package:coin_ease/services/auth_service.dart';
import 'package:coin_ease/services/request_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  final RequestsBloc _ListBloc = RequestsBloc();
  AuthService auth = AuthService();
  RequestService req = RequestService();
  UserModel? user;
  bool loading = false;
  List<RequestModel>? reqList = [];
  Future<void> _initializeData() async {
    setState(() {
      loading = true;
    });
    user = await auth.getLoggedInUser();
    reqList = await req.getRequests(user);
    setState(() {
      loading = false;
    });
    print(reqList.toString());
  }

   @override
  void initState() {
    super.initState();
    _loadData();
    RequestsRepository().getList();
     Future.delayed(Duration.zero, () {
      _initializeData();
    });
  }

  Future<void> _loadData() async {
    _ListBloc.add(LoadRequestsEvent());
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Requests'),
      ),
      body: _buildBody(),
    );
  }

   Widget _buildBody() {
    return BlocBuilder<RequestsBloc, RequestState>(
      bloc: _ListBloc,
      builder: (context, state) {
        if (state is RequestLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is RequestLoadedState) {
          return reqList!.isEmpty
          ? const Center(
              //child: CircularProgressIndicator()
              child: Text('No Requests Found'),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: reqList?.length,
              itemBuilder: (context, index) {
                RequestModel request = reqList![index];
                return Container(
                  margin: const EdgeInsets.only(top: 5, bottom: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors['secondary'],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RequestDetail(
                                  request: request,
                                  user: user!,
                                )),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: colors['primary'],
                        child: Text(
                          (request.reqfrom['title'] ?? '')
                              .substring(0, 1)
                              .toUpperCase(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(request.reqfrom['title'] ?? ''),
                      subtitle: Text(request.dateTime.toDate().toString()),
                      trailing: Text(
                        ' Rs. ${request.amount}',
                        style: const TextStyle(
                            color:   Color.fromARGB(255, 9, 129, 79),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                );
              
              });
        } else if (state is RequestErrorState) {
          return Center(
            child: Text(state.error),
          );
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

}