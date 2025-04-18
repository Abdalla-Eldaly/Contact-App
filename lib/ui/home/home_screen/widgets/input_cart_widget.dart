import 'dart:io';

import 'package:contact_app/core/app_assets/app_assets.dart';
import 'package:contact_app/core/app_colors/app_colors.dart';
import 'package:contact_app/core/model/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class InputCartWidget extends StatefulWidget {
  InputCartWidget(
      {super.key,
      this.image,
        required this.onClick,
      required this.nameController,
      required this.emailController,
      required this.phoneController});

  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController phoneController;

  File? image;
  Function onClick;

  @override
  State<InputCartWidget> createState() => _InputCartWidgetState();
}

class _InputCartWidgetState extends State<InputCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
widget.onClick();
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .3,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColor.gold)),
              child: AspectRatio(
                aspectRatio: 1,
                child: widget.image == null
                    ? Lottie.asset(AppAssets.imagePickerAnimation)
                    : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(widget.image!,fit: BoxFit.cover,)),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: widget.nameController,
              builder: (context, value, child) {
                return Text(
                  value.text.isEmpty ? "User Name" : value.text,
                  style: TextStyle(
                      color: AppColor.gold,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: widget.emailController,
              builder: (context, value, child) {
                return Text(
                  value.text.isEmpty ? "exmple@gmail,com" : value.text,
                  style: TextStyle(
                      color: AppColor.gold,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: widget.phoneController,
              builder: (context, value, child) {
                return Text(
                  value.text.isEmpty ? "+200000000" : value.text,
                  style: TextStyle(
                      color: AppColor.gold,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
