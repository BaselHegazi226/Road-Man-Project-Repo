import 'package:flutter/material.dart';

import '../../../../../core/helper/const_variables.dart';

class JobViewSearchBarSection extends StatelessWidget {
  const JobViewSearchBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Expanded(
            child: SearchBar(
              backgroundColor: WidgetStateProperty.all(Color(0xffE6E8EE)),
              hintText: 'Job title',
              leading: Icon(Icons.search_outlined),
              hintStyle: WidgetStatePropertyAll(TextStyle()),
              elevation: WidgetStatePropertyAll(0),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: kAppPrimaryBlueColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.tune_outlined,
              color: kAppPrimaryWhiteColor,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
