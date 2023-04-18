import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants.dart';
import '../route/route.name.dart';
import '../widgets/custom.text.dart';
import '../widgets/custom_button.dart';

class LandingPage extends GetView {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.primaryWhite,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "News",
                  colour: AppColours.primaryBlack,
                  weight: FontWeight.w700,
                  size: 40.sp,
                ),
                SizedBox(height: 13.h),
                CustomText(
                  text:
                      "Come on, get the latest articles and updates everyday and add insight, your trusted knowledge with us",
                  colour: AppColours.primaryBlack,
                  weight: FontWeight.w700,
                  size: 16.sp,
                ),
                SizedBox(height: 97.h),
                CustomButton(
                  onclick: () {
                    Get.toNamed(RouteName.login);
                  },
                  child: const Text("Login"),
                ),
                SizedBox(height: 21.h),
                SizedBox(
                  height: 50.h,
                  width: 329.w,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    onPressed: () => Get.toNamed(RouteName.signup),
                    child: CustomText(
                        text: "Sign Up",
                        colour: AppColours.primaryBlack,
                        weight: FontWeight.w700,
                        size: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
