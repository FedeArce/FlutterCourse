import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final titleContrller = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  InputCard(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleContrller,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () {
                addNewTransaction(
                  titleContrller.text,
                  double.parse(amountController.text),
                );
              },
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
