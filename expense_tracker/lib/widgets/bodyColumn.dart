import 'package:flutter/material.dart';

import 'inputCard.dart';
import 'transactionColumn.dart';
import '../models/transaction.dart';

class BodyColumn extends StatefulWidget {
  @override
  _BodyColumnState createState() => _BodyColumnState();
}

class _BodyColumnState extends State<BodyColumn> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: DateTime.now().toString(),
      title: 'New Shoes',
      amount: 99.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: DateTime.now().toString(),
      title: 'Gorcery',
      amount: 19.99,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final tx = Transaction(
      title: title,
      amount: amount,
      date: DateTime.now(),
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(tx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InputCard(_addNewTransaction),
        TransactionColumn(_userTransaction),
      ],
    );
  }
}
