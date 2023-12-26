import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  Future<Map<String, dynamic>> fetchDataFromFirebase() async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;

      // Fetch the number of users
      QuerySnapshot<Map<String, dynamic>> usersSnapshot =
          await _firestore.collection('users').get();
      int numberOfUsers = usersSnapshot.size;

      // Fetch transactions for each month
      QuerySnapshot<Map<String, dynamic>> transactionsSnapshot =
          await _firestore.collectionGroup('transactions').get();

      // Create a map to store monthly transaction counts
      Map<String, int> monthlyTransactionCounts = {};

      // Create a map to store incoming and outgoing amounts
      Map<String, double> incomingAmounts = {};
      Map<String, double> outgoingAmounts = {};

      // Iterate through transactions
      transactionsSnapshot.docs.forEach((transactionDoc) {
        DateTime transactionDateTime =
            (transactionDoc['dateTime'] as Timestamp).toDate();
        String monthYearKey =
            '${transactionDateTime.month}-${transactionDateTime.year}';

        // Count transactions for each month
        monthlyTransactionCounts[monthYearKey] =
            (monthlyTransactionCounts[monthYearKey] ?? 0) + 1;

        // Calculate incoming and outgoing amounts
        double transactionAmount = transactionDoc['amount'].toDouble();
        if (transactionDoc['isDebit']) {
          outgoingAmounts[monthYearKey] =
              (outgoingAmounts[monthYearKey] ?? 0) + transactionAmount;
        } else {
          incomingAmounts[monthYearKey] =
              (incomingAmounts[monthYearKey] ?? 0) + transactionAmount;
        }
      });

      // Ensure all months have entries, setting counts and amounts to 0 if not present
      // List of months, assuming you want to consider all months from January to December
      List<String> allMonths =
          List.generate(12, (index) => '${index + 1}-${DateTime.now().year}');

      allMonths.forEach((month) {
        monthlyTransactionCounts.putIfAbsent(month, () => 0);
        incomingAmounts.putIfAbsent(month, () => 0);
        outgoingAmounts.putIfAbsent(month, () => 0);
      });

      // Return the results as a map
      return {
        'numberOfUsers': numberOfUsers,
        'monthlyTransactionCounts': monthlyTransactionCounts,
        'incomingAmounts': incomingAmounts,
        'outgoingAmounts': outgoingAmounts,
      };
    } catch (e) {
      print('Error fetching data from Firebase: $e');
      // Return an empty map or handle the error as needed
      return {};
    }
  }
}
