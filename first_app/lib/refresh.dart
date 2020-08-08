import 'package:flutter/material.dart';

class Refresh extends StatelessWidget {
  final Function selectHandler;

  Refresh(this.selectHandler);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: selectHandler,
      tooltip: 'Restart game',
      child: const Icon(Icons.refresh),
    );
  }
}
