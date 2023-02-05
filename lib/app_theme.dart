import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static const Color white = Color(0xFFFFFFFF),
      black = Color(0xFF000000),
      lightgrey = Color.fromRGBO(0, 0, 0, 0.03),
      darkgrey = Color(0xFFD9D9D9),
      yellow = Color(0xFFFCD240),
      orange = Color(0xFFFD5B1F);

  static TextStyle h1 = TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      h2 = TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      ),
      h3 = TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
      );

  static OutlineInputBorder transparentOutlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: const BorderSide(color: Colors.transparent),
  );
}
