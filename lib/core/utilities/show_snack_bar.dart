import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String snackText, Color color) {
  final SnackBar snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: color.withOpacity(.8),
    elevation: 8.0,
    margin: const EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    content: Text(
      maxLines: 1,
      snackText,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
        fontFamily: 'cairo',
      ),
    ),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () async {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
      textColor: color,
      backgroundColor: Colors.white,
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
