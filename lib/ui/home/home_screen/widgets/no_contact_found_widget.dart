import 'package:contact_app/core/app_assets/app_assets.dart';
import 'package:contact_app/core/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoContactFoundWidget extends StatelessWidget {
  const NoContactFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(AppAssets.emptyListAnimation),
        Text(
          'There is No Contacts Added Here',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,
          color: AppColor.gold),
        )
      ],
    );
  }
}
