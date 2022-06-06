import 'package:flutter/material.dart';

showErrorMessage(String message) {
  return SnackBar(
    content: Text(message),
    backgroundColor: Colors.red,
  );
}
