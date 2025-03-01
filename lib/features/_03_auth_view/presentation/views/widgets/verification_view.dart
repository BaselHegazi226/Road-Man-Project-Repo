import 'package:flutter/material.dart';
import 'package:road_man_project/core/helper/const_functions.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: ConstFunctions.customAppBar(text: 'Verification'));
  }
}
