import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {
  String titleInput;
  String amountInput;

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
              onChanged: (val) {
                titleInput = val;
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onChanged: (val) {
                amountInput = val;
              },
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () {},
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
