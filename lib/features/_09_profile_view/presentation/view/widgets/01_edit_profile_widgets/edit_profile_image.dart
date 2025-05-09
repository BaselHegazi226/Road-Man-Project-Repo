import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // استيراد الحزمة
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/base_text_styles.dart';

import '../../../../../../generated/assets.dart';

class EditProfileImage extends StatelessWidget {
  const EditProfileImage({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });
  final double screenHeight;
  final double screenWidth;

  // دالة لاختيار الصورة
  Future<void> _pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    // اختيار الصورة من المعرض
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      // هنا يمكنك التعامل مع الصورة التي تم اختيارها (مثل عرضها أو حفظها)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to upload image',
            style: AfacadTextStyles.textStyle12W500Black(
              context,
            ).copyWith(color: Colors.red),
          ),
        ),
      );
    } else {
      print('success upload image');
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
          height: screenWidth * .4,
          width: screenWidth * .4,
        ),
        Positioned(
          bottom: 0,
          right: screenWidth * .01,
          child: Container(
            padding: EdgeInsets.all(screenWidth * .01),
            decoration: const BoxDecoration(
              color: kFilledTextFormFieldColor,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () => _pickImage(context), // استدعاء الدالة لاختيار الصورة
              child: Icon(
                Icons.camera_alt_outlined,
                size: screenWidth * .05,
                color: kAppPrimaryBlackColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
