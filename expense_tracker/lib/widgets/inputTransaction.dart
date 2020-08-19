import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTransaction extends StatefulWidget {
  final Function addNewTransaction;

  InputTransaction(this.addNewTransaction);

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final _titleContrller = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_titleContrller.text.isNotEmpty &&
        _amountController.text.isNotEmpty &&
        _selectedDate != null) {
      final enteredTitle = _titleContrller.text;
      final enteredAmount = double.parse(_amountController.text);
      final enteredDate = _selectedDate;
      widget.addNewTransaction(enteredTitle, enteredAmount, enteredDate);
      Navigator.of(context).pop();
    }
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2021),
    ).then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        });
      }
    });
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
              controller: _titleContrller,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      _selectedDate != null
                          ? DateFormat.yMd().format(_selectedDate)
                          : 'No Date Chosen',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: _presentDatePicker,
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: _submitData,
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).textTheme.button.color,
            )
          ],
        ),
      ),
    );
  }
}
