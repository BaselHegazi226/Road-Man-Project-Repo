import 'package:flutter/material.dart';

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
        TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 15,
          letterSpacing: -.285,
          height: 1.5,
          color: Color.fromRGBO(19, 19, 20, 0.50),
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
