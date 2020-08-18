import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dayChart.dart';
import '../models/transaction.dart';

class WeekChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  WeekChart(this.recentTransactions);

  List<Map<String, Object>> get gropedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double total = 0.0;

      for (int i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          total += recentTransactions[i].amount;
        }
      }

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': total,
      };
    });
  }

  double get totSpent {
    return gropedTransactionValues.fold(0.0, (sum, tx) {
      return sum + tx['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: gropedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: DayChart(
                data['day'],
                data['amount'],
                totSpent == 0.0 ? 0.0 : (data['amount'] as double) / totSpent,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
