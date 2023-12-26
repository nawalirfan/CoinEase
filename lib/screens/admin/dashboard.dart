import 'package:coin_ease/colors.dart';
import 'package:coin_ease/services/admin_service.dart';
import 'package:coin_ease/widgets/line_chart.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  AdminService adminService = AdminService();
  Map<String, dynamic>? data;

  Future<void> _initializeData() async {
    data = await adminService.fetchDataFromFirebase();
    print(data.toString());
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _initializeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors['primary'],
        title: const Text('Dashboard'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                child: LineChartGraph(
                    monthlyTransactionCounts:
                        data?['monthlyTransactionCounts'])),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: GridView.count(
                  crossAxisCount: 2,
                  children: [
                    GridTile(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colors['secondary'],
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: Column(
                          children: [
                            Text('No of Users:'),
                            Text(data?['noOfUsers'])
                          ],
                        )),
                      ),
                    ),
                    GridTile(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colors['secondary'],
                            borderRadius: BorderRadius.circular(15)),
                        child:
                            Center(child: Text('Outgoing transaction amount:')),
                      ),
                    ),
                    GridTile(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colors['secondary'],
                            borderRadius: BorderRadius.circular(15)),
                        child:
                            Center(child: Text('Incoming transaction amount:')),
                      ),
                    ),
                    GridTile(
                      child: Container(
                        margin: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: colors['secondary'],
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(child: Text('No of Users:')),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
