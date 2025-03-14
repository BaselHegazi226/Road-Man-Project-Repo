import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    this.shadowColor = Colors.transparent,
    this.borderColor = Colors.transparent,
    required this.child,
  });
  final Widget child;
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color shadowColor;
  final Color borderColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          shadowColor: shadowColor,
          elevation: 5,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            side: BorderSide(color: borderColor, width: 1.5),
          ),
        ),
        child: child,
      ),
    );
  }
}
