import 'package:flutter/material.dart';

class Styles {
  static TextStyle textStyleFun({required Color color, required double size}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: FontWeight.bold,
      fontFamily: 'cairo',
    );
  }
}
