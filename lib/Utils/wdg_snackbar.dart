
import 'package:flutter/material.dart';

/// show msg on snackbar
void showSnackBar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}

