import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // استيراد الحزمة
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';

import '../../../../../../generated/assets.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (!mounted) return; // ✅ تأكد إن الـ widget لسه موجود

    if (image == null) {
      print('❌ Failed to upload image');
      showSafeSnackBar(
        context,
        'Failed to upload Image',
        kAppPrimaryWrongColor,
      );
    } else {
      print('✅ Success upload image');
      showSafeSnackBar(context, 'Success Upload Image', kAppPrimaryBlueColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          Assets.profileProfileUserImage,
          fit: BoxFit.contain,
          height: widget.screenWidth * .4,
          width: widget.screenWidth * .4,
        ),
        Positioned(
          bottom: 0,
          right: widget.screenWidth * .01,
          child: Container(
            padding: EdgeInsets.all(widget.screenWidth * .01),
            decoration: const BoxDecoration(
              color: kFilledTextFormFieldColor,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () => _pickImage(),
              child: Icon(
                Icons.camera_alt_outlined,
                size: widget.screenWidth * .05,
                color: kAppPrimaryBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
