import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

const _duration = Duration(seconds: 3);
const _margin = EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 4,
);
const _borderRadius = 10.0;

Flushbar createSnackBar(
  BuildContext context, {
  required String message,
}) {
  final theme = Theme.of(context);
  final snackBarTheme = theme.snackBarTheme;

  return Flushbar(
    messageText: Text(
      message,
      style: snackBarTheme.contentTextStyle,
    ),
    duration: _duration,
    margin: _margin,
    backgroundColor: snackBarTheme.backgroundColor ?? Colors.transparent,
    flushbarPosition: FlushbarPosition.TOP,
    borderRadius: BorderRadius.circular(_borderRadius),
  )..show(context);
}
