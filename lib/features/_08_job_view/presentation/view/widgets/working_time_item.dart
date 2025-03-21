import 'package:flutter/material.dart';

import '../../../../../core/helper/const_variables.dart';

class WorkingTimeItem extends StatefulWidget {
  const WorkingTimeItem({super.key, required this.title});
  final String title;

  @override
  State<WorkingTimeItem> createState() => _WorkingTimeItemState();
}

class _WorkingTimeItemState extends State<WorkingTimeItem> {
  bool isEnableButton = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isEnableButton = !isEnableButton; // Toggle state
        });
      },
      child: Container(
        height: 32,
        padding: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isEnableButton ? kAppPrimaryBlueColor : Colors.transparent,
          border: Border.all(color: const Color(0xff131314), width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isEnableButton ? kAppPrimaryWhiteColor : kTextPrimaryColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
