import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:road_man_project/core/helper/const_variables.dart';
import 'package:road_man_project/core/utilities/show_snack_bar.dart';

class EditProfileImage extends StatefulWidget {
  const EditProfileImage({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.image,
    this.onImagePicked,
  });

  final double screenHeight;
  final double screenWidth;
  final String image;

  final void Function(String imagePath)? onImagePicked;

  @override
  State<EditProfileImage> createState() => _EditProfileImageState();
}

class _EditProfileImageState extends State<EditProfileImage> {
  late String image;

  @override
  void initState() {
    super.initState();
    image = widget.image;
  }

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
        image = pickedImage.path;
      });
      print('image path : $image');
      // ✅ نرجع الصورة للأب
      widget.onImagePicked?.call(pickedImage.path);

      showSafeSnackBar(context, '✅ Image Uploaded', kAppPrimaryBlueColor);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        image.startsWith('/data/')
            ? Image.file(
              File(image),
              fit: BoxFit.contain,
              height: widget.screenWidth * .4,
              width: widget.screenWidth * .4,
            )
            : Image.asset(
              image,
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
