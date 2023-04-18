import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    // required this.inputAction,
    required this.hint,
    required this.label,
    this.readOnly,
    this.maxLength,
    required this.inputType,
    required this.inputFormat,
    this.validator,
  });

  final TextEditingController controller;
  // final TextInputAction inputAction;
  final String hint;
  final String label;
  final bool? readOnly;
  final int? maxLength;
  final validator;
  final TextInputType inputType;
  final List<TextInputFormatter> inputFormat;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 49.h,
      width: 378.w,
      child: TextFormField(
        style: GoogleFonts.lato(
          color: AppColours.primaryGrey,
          fontSize: 16.sp,
          fontWeight: kFW400,
        ),
        cursorColor: AppColours.primaryWhite,
        controller: controller,
        textInputAction: kActionNext,
        readOnly: readOnly ?? false,
        maxLength: maxLength,
        validator: validator,
        keyboardType: inputType,
        inputFormatters: inputFormat,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          hintStyle: GoogleFonts.lato(
            color: AppColours.primaryGrey,
            fontSize: 16.sp,
            fontWeight: kFW400,
          ),
          filled: true,
          fillColor: AppColours.primaryWhite,
          counterText: "",
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColours.primaryGrey, width: 1.5.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.5.w),
            borderRadius: BorderRadius.circular(8.r),
          ),
        ),
      ),
    );
  }
}
