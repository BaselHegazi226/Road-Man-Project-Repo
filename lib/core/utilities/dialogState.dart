import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:road_man_project/core/utilities/text_styles.dart';

import '../helper/class_const_functions.dart';
import '../helper/const_variables.dart';
import 'custom_text_button.dart';

void customAwesomeDialog({
  required BuildContext context,
  final bool needCancel = false,
  required final String dialogState,
  final String title = 'Success process',
  final String description = 'You are in active mode',
  final Color dialogStateColor = kAppPrimaryBlueColor,
  final Color dialogBackgroundColor = kSecondlyLightWhiteColor,
  final Color dialogBorderColor = kSecondlyLightWhiteColor,
  final Color titleColor = kAppPrimaryBlueColor,
  final double titleSize = 24,
  final Color descriptionColor = kSecondlyDarkWhiteColor,
  final double descriptionSize = 18,
  required void Function()? onSuccessPressed,
  required void Function()? onCancelPressed,
}) {
  AwesomeDialog(
    context: context,
    dialogType: ConstFunctions.dialogType(type: dialogState),
    dialogBackgroundColor: dialogBackgroundColor,
    width: double.infinity,
    buttonsBorderRadius: BorderRadius.circular(8),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    headerAnimationLoop: false,
    animType: AnimType.scale,
    title: title,
    desc: description,
    showCloseIcon: true,
    borderSide: BorderSide(color: dialogBorderColor, width: 2),
    titleTextStyle: Styles.textStyleFun(color: titleColor, size: titleSize),
    descTextStyle: Styles.textStyleFun(
      color: descriptionColor,
      size: descriptionSize,
    ),
    btnOk: CustomTextButton(
      onPressed: onSuccessPressed,
      backgroundColor: dialogStateColor,
      shadowColor: Colors.transparent,
      child: Text(
        'Ok',
        style: Styles.textStyleFun(color: Colors.white, size: 18),
      ),
    ),
    btnCancel:
        needCancel
            ? CustomTextButton(
              onPressed: onCancelPressed,
              backgroundColor: Colors.black.withOpacity(.8),
              shadowColor: Colors.transparent,
              child: Text(
                'Cancel',
                style: Styles.textStyleFun(color: Colors.white, size: 18),
              ),
            )
            : null,
    //btnOkColor: dialogStateColor,
    // btnCancelColor: Colors.black.withOpacity(.8),
    // btnCancelOnPress: () {
    //   print('cancel');
    // },
    // btnOkOnPress: () {
    //   print('press ok success');
    // },
  ).show();
}

void failureAwesomeDialog(BuildContext context) {
  AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    borderSide: const BorderSide(color: Colors.white, width: 2),
    width: MediaQuery.sizeOf(context).width * .7,
    buttonsBorderRadius: const BorderRadius.all(Radius.circular(8)),
    dismissOnTouchOutside: true,
    dismissOnBackKeyPress: true,
    headerAnimationLoop: false,
    animType: AnimType.scale,
    title: 'Success',
    desc: 'Process Failure',
    descTextStyle: Styles.textStyleFun(color: Colors.grey, size: 22),
    showCloseIcon: true,
    btnCancelOnPress: () {
      print('cancel');
    },
    btnOkOnPress: () {
      print('press ok failure');
    },
  ).show();
}
