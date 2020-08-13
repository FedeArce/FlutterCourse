import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  final titleContrller = TextEditingController();
  final amountController = TextEditingController();
  final Function addNewTransaction;

  InputCard(this.addNewTransaction);

  void submitData() {
    if (titleContrller.text.isNotEmpty && amountController.text.isNotEmpty) {
      final enteredTitle = titleContrller.text;
      final enteredAmount = double.parse(amountController.text);
      addNewTransaction(enteredTitle, enteredAmount);
    }
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: submitData,
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
