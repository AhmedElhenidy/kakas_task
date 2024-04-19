import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../utils/app_colors.dart';

class OtpWidget extends StatelessWidget {
  final void Function(String)? onCompleted;
  final TextEditingController? controller;
  final int length;
  const OtpWidget({
    this.onCompleted,
    this.controller,
    this.length =4,
    super.key});

  @override
  Widget build(BuildContext context) {
    return  Pinput(
      controller: controller,
      length: length,
      onCompleted: onCompleted,
      defaultPinTheme: PinTheme(
        width: 75.w,
        height: 75.w,
        textStyle: TextStyle(
          fontSize: 36.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          // fontFamily: fontRegular,
        ),
        decoration: BoxDecoration(
          color: AppColors.black262626,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 75.w,
        height: 75.w,
        textStyle: TextStyle(
          fontSize: 36.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w700,
          // fontFamily: fontRegular,
        ),
        decoration: BoxDecoration(
          color: AppColors.black262626,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.white,),
        ),
      ),
    );
  }
}
