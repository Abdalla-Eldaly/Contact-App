import 'package:contact_app/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hintText, required this.controller, this.validator, this.textInputType});
  final String hintText ;
  final TextEditingController controller ;
  final String? Function(String?)? validator ;
  final TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10,),
        TextFormField(
          validator:validator ,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: textInputType,
          controller: controller,
          style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColor.offWhite),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: AppColor.offWhite),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColor.gold,width: 1)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.gold,width: 1)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.red,width: 1)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColor.red,width: 1)
            )

          ),
        ),
        SizedBox(height: 10,),

      ],
    );
  }
}
