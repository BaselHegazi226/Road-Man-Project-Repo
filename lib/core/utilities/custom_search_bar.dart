import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../helper/const_variables.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.searchBarEditingController,
    required this.searchFocusNode,
    required this.hintText,
  });
  final TextEditingController searchBarEditingController;
  final FocusNode searchFocusNode;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 8)),
      backgroundColor: WidgetStateProperty.all(Color(0xffE6E8EE)),
      hintText: hintText,
      hintStyle: WidgetStatePropertyAll(
        AfacadTextStyles.textStyle16W500H150Black.copyWith(
          color: kTextGreyHalfOpacityPrimaryColor,
        ),
      ),
      leading: Icon(
        Icons.search_outlined,
        color: kTextBlackPrimaryColor.withAlpha(126),
        size: 24,
      ),
      elevation: WidgetStatePropertyAll(0),
      controller: searchBarEditingController,
      focusNode: searchFocusNode,
    );
  }
}
