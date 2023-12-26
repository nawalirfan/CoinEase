import 'package:cloud_firestore/cloud_firestore.dart';

class RequestModel {
  final String id;
  final double amount;
  final Map<String, dynamic> reqfrom;
  final Timestamp dateTime;
  final String message;

  RequestModel({
    required this.id,
    required this.amount,
    required this.reqfrom,
    required this.dateTime,
    required this.message,
  });
}
