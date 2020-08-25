import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptiveIconButton extends StatelessWidget {
  final Function function;

  AdaptiveIconButton({@required this.function});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IconButton(
            icon: Icon(CupertinoIcons.game_controller_solid),
            onPressed: function,
          )
        : IconButton(
            icon: Icon(Icons.calendar_today),
            onPressed: function,
          );
  }
}
