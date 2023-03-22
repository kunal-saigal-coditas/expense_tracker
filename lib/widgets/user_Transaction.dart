import 'package:flutter/material.dart';
import './transactionList.dart';
import './new_Transaction.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({Key key}) : super(key: key);

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: "t1",
      title: "Sneakers",
      amount: 1500,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t1",
      title: "Groceries",
      amount: 500,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransaction),
      ],
    );
  }
}
