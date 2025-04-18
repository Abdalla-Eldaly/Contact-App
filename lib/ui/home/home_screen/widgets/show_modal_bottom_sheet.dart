import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/app_colors/app_colors.dart';
import '../../../../core/model/contact_model.dart';
import '../../../common/widgets/custom_text_field.dart';
import 'input_cart_widget.dart';
class ShowModalBottomSheet extends StatefulWidget {
  const ShowModalBottomSheet({super.key});

  @override
  State<ShowModalBottomSheet> createState() => _ShowModalBottomSheetState();
}
class _ShowModalBottomSheetState extends State<ShowModalBottomSheet> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? image;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: 5,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: formKey,
          child: Wrap(
            children: [
              const Row(),
              InputCartWidget(
                onClick: ()async{
                  ImagePicker imagePicker = ImagePicker();
                  var file = await   imagePicker.pickImage(source: ImageSource.gallery);

                  image = File(file!.path);
                  setState(() {

                  });
                },
                nameController: nameController,
                phoneController: phoneController,
                emailController: emailController,
                image: image,

              ),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                textInputType: TextInputType.name,
                hintText: 'Enter your Name',
                controller: nameController,
              ),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  } else if (!RegExp(
                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$")
                      .hasMatch(value)) {
                    return 'Enter valid email';
                  }
                  return null;
                },
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your email',
                controller: emailController,
              ),
              CustomTextField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  } else if (value.length != 11) {
                    return "Enter valid phone number";
                  }
                  return null;
                },
                textInputType: TextInputType.number,
                hintText: 'Enter your Phone',
                controller: phoneController,
              ),
              FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: AppColor.gold,
                  foregroundColor: AppColor.lightBlue,
                  fixedSize: const Size.fromHeight(45),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    if (image == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please pick an image."),
                      ));
                      return;
                    }
                    Contact.contacts.add(Contact(
                        name: nameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        image: image!));
                    Navigator.pop(context);
                  }
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Add User',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}