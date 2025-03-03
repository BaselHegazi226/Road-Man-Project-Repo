import 'package:flutter/material.dart';

class CustomFlexibleWidget extends StatelessWidget {
  const CustomFlexibleWidget({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          child: child,
        ),
      ),
    );
  }
}
