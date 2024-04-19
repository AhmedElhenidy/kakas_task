
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_task/features/bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/screens/signin_screen.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ImageWidget(
            imageUrl: AppImages.background,
            width: 1.sw,
            height: 1.sh,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                64.verticalSpace,
                ImageWidget(
                  imageUrl: AppAssets.kakasLogo,
                  width: 400.w,
                  height: 400.h,
                ),
                TextWidget(
                  title: 'SELECT LANGUAGE\nاختر اللغة',
                  titleSize: 22.sp,
                  titleFontWeight: FontWeight.w600,
                ),
                35.verticalSpace,
                ButtonWidget(
                  onPressed: (){
                    if(context.locale.languageCode!="en"){
                      context.setLocale(const Locale("en"));
                    }
                    navigateTo(SignInScreen());
                  },
                  outlined: true,
                  height: 58.h,
                  text: AppStrings.english.tr(),
                ),
                12.verticalSpace,
                ButtonWidget(
                  onPressed: (){
                    if(context.locale.languageCode!="ar"){
                      context.setLocale(const Locale("ar"));
                    }
                    navigateTo(SignInScreen());
                  },
                  outlined: true,
                  height: 58.h,
                  text: AppStrings.arabic.tr(),
                ),
                116.verticalSpace,
                TextWidget(title: 'VERSION 1.0')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
