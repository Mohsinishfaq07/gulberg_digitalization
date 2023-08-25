import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'globals.dart';

class ShowSnackBar {
  static show(String text, {Color? color}) {
    if (text.isEmpty) {
      return;
    }

    final SnackBar snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color ?? AppTheme.appTheme.primaryColor,
      duration: const Duration(milliseconds: 3500),
    );
    snackbarKey.currentState
      ?..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
