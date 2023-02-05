import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme.dart';

class TrackSearchField extends StatelessWidget {
  const TrackSearchField({
    required this.controller,
    required this.node,
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode node;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 342.w,
      child: Card(
        color: const Color(0xFFE4E4E4),
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          focusNode: node,
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 16.w, bottom: 20.h),
            border: AppTheme.transparentOutlineBorder,
            enabledBorder: AppTheme.transparentOutlineBorder,
            focusedBorder: AppTheme.transparentOutlineBorder,
            hintText: 'Search',
            hintStyle: AppTheme.h3.copyWith(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(0, 0, 0, 0.2),
            ),
          ),
          onSubmitted: (query) {},
          textInputAction: TextInputAction.search,
        ),
      ),
    );
  }
}
