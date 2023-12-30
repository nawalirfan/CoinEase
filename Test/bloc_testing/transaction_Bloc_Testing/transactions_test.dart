import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:coin_ease/bloc/transactions/transaction_bloc.dart';
import 'package:coin_ease/bloc/transactions/transaction_event.dart';
import 'package:coin_ease/bloc/transactions/transaction_state.dart';
import 'package:coin_ease/models/transaction_model.dart';
import 'package:coin_ease/models/user_model.dart';

import 'mockRepo.dart';

void main() {
  group('TransactionBloc Tests', () {
    late MockTransactionRepository mockRepository;
    late TransactionBloc transactionBloc;
    late UserModel testUser;

    setUp(() {
      mockRepository = MockTransactionRepository();
      transactionBloc = TransactionBloc(mockRepository);
      testUser = UserModel(id: '1',
        phoneNumber: '1234567890',
        password: 'password',
        name: 'John Doe',
        cnic: '1234567890123',
        dateOfIssuance: '01/01/2022',
        motherName: 'Jane Doe',
        role: 'user',);
    });

    tearDown(() {
      transactionBloc.close();
    });

    // Test loading transactions successfully
    blocTest<TransactionBloc, Transaction_State>(
      'emits [LoadingTransactionState, LoadedTransactionState] when transactions are loaded successfully',
      build: () => transactionBloc,
      act: (bloc) => bloc.add(LoadTransactionEvent(testUser)),
      expect: () => [
        LoadingTransactionState(),
      ],
    );
   

    // Test creating a new transaction
    blocTest<TransactionBloc, Transaction_State>(
      'emits [LoadingTransactionState, LoadedTransactionState] after creating a new transaction',
      build: () => transactionBloc,
      act: (bloc) {
        bloc.add(LoadTransactionEvent(testUser));
      },
      expect: () => [
        LoadingTransactionState(),
       
      ],
    );
  });
}