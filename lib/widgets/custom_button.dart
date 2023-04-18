import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onclick,
    required this.child,
  });

  final void Function() onclick;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 329.w,
      child: RawMaterialButton(
        onPressed: onclick,
        fillColor: AppColours.primaryBlue,
        textStyle: GoogleFonts.lato(
          color: AppColours.primaryWhite,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        child: child,
      ),
    );
  }
}
