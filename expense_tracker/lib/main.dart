import 'package:expense_tracker/widgets/weekChard.dart';
import 'package:flutter/material.dart';

import 'widgets/transactionList.dart';
import 'widgets/inputTransaction.dart';
import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expense',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.orange,
          errorColor: Colors.grey,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
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

  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      final today = DateTime.now();
      bool weekTx =
          tx.date.isAfter(today.subtract(Duration(days: today.weekday))) &&
              tx.date.isBefore(today.add(Duration(days: 7 - today.weekday)));
      return weekTx;
    }).toList();
  }

  List<Transaction> get _orderedTransaction {
    _userTransaction.sort((a, b) => b.date.compareTo(a.date));
    return _userTransaction;
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final tx = Transaction(
      title: title,
      amount: amount,
      date: date,
      id: DateTime.now().toString(),
    );
    setState(() {
      _userTransaction.add(tx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) {
        return tx.id == id;
      });
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return InputTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expense'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            WeekChart(_recentTransaction),
            TransactionList(_orderedTransaction, _deleteTransaction),
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
