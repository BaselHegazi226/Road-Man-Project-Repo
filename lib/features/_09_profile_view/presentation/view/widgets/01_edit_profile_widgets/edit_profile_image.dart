import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';

import '../00_profile_common_widgets/custom_image_profile.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    required this.onImagePicked,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;

  /// 🔁 سيتم استدعاؤها فقط عند اختيار صورة جديدة (path)
  final void Function(String imagePath) onImagePicked;

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  String? _temporaryImagePath;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.gallery,
    );

    if (!mounted) return;

    if (pickedImage == null) {
      showSafeSnackBar(
        context,
        '❌ Failed to upload Image',
        kAppPrimaryWrongColor,
      );
    } else {
      setState(() {
        _temporaryImagePath = pickedImage.path;
      });
      widget.onImagePicked(pickedImage.path);
      showSafeSnackBar(context, '✅ Image Selected', kAppPrimaryBlueColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    final imageToShow = _temporaryImagePath ?? widget.image;
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Stack(
      alignment: Alignment.center,
      children: [
        imageToShow.startsWith('/data/')
            ? CustomImageProfile(
              imageSize: screenWidth * .42,
              image: Image.file(
                File(imageToShow),
                fit: BoxFit.cover,
                height: widget.screenWidth * .4,
                width: widget.screenWidth * .4,
              ),
            )
            : CustomImageProfile(
              imageSize: screenWidth * .42,
              image: Image.asset(
                imageToShow,
                fit: BoxFit.cover,
                height: widget.screenWidth * .4,
                width: widget.screenWidth * .4,
              ),
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
              onTap: _pickImage,
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
