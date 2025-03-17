import 'package:flutter/material.dart';

import '../../../../../../core/helper/const_variables.dart';
import '../../../../data/model/logout_item_model.dart';

class LogoutItem extends StatelessWidget {
  const LogoutItem({
    super.key,
    required this.logoutItemModel,
    required this.onTap,
  });
  final LogoutItemModel logoutItemModel;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: logoutItemModel.routeName.isNotEmpty ? onTap : null,
      splashColor: kAppPrimaryBlueColor.withAlpha(15),
      borderRadius: BorderRadius.circular(8),
      child: ListTile(
        leading: Icon(
          logoutItemModel.prefixIcon,
          size: 24,
          color: kProfileIconColor,
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            logoutItemModel.title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: kTextPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
