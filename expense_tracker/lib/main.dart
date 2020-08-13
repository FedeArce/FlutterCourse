import 'package:flutter/material.dart';

import 'widgets/transactionColumn.dart';
import 'widgets/inputCard.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return InputCard(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TransactionColumn(_userTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
