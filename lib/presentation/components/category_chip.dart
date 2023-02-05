import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip(
      {required this.title, required this.active, required this.path, Key? key})
      : super(key: key);
  final String title;
  final bool active;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w),
      child: Chip(
        elevation: 2,
        backgroundColor: AppTheme.white,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        avatar: SizedBox(
          width: 40.w,
          height: 40.h,
          child: Image.asset(
            path,
            fit: BoxFit.cover,
          ),
        ),
        label: Text(
          title,
          style: AppTheme.h3.copyWith(
            fontFamily: 'Urbanist',
          ),
          textAlign: TextAlign.center,
        ),
        side: BorderSide(
          color: active ? const Color(0xFF5DC720) : AppTheme.white,
        ),
      ),
    );
  }
}
