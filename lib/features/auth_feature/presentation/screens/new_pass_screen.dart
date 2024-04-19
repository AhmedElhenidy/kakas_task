import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';

class NewPassScreen extends StatelessWidget {
  const NewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: 24.w,vertical: 190.h
        ),
      child: Column(
        children: [
          TextWidget(
            title:AppStrings.enterNewPassword.tr(),
            titleFontWeight: FontWeight.w700,
            titleSize: 26.sp,
          ),
          SizedBox(height: 45.h,),
          CustomFormField(
            hint: AppStrings.newPassword.tr(),
            keyboardType: TextInputType.text,
            obscure: true,
            prefixIconWidget: ImageWidget(
              imageUrl: AppAssets.lock,
              width: 24.w,
              height: 24.h,
            ),
          ),
          SizedBox(height: 35.h,),
          CustomFormField(
            hint: AppStrings.confirmNewPassword.tr(),
            keyboardType: TextInputType.text,
            obscure: true,
            prefixIconWidget: ImageWidget(
              imageUrl: AppAssets.lock,
              width: 24.w,
              height: 24.h,
            ),
          ),
          SizedBox(height: 40.h,),
          ButtonWidget(
            onPressed: (){
            },
            height: 58.h,
            text: AppStrings.changeNow.tr(),
          ),
        ],
      ),
      ),
    );
  }
}
