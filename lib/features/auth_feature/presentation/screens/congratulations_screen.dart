import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';
import '../widget/clique_stack.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3),()=> navigateTo(const CliqueBottomNavigation(),removeAll: true));
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: 40.w,vertical: 90.h
        ),
        child: Column(
          children: [
            const CliqueStack(),
            SizedBox(height: 75.h,),
            Container(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 38.w, vertical: 57.h
              ),
              height: 477.h,
              width: 348.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.black262626,
              ),
              child: Column(
                children: [
                  ImageWidget(
                      imageUrl: AppAssets.congratulations,
                    height:104.h ,
                    width: 102.w,
                  ),
                  SizedBox(height: 30.h,),
                  TextWidget(
                      title: AppStrings.welcome.tr(),
                    titleFontWeight: FontWeight.w600,
                    titleSize: 24.sp,
                  ),
                  TextWidget(
                    title: 'user',
                    titleFontWeight: FontWeight.w600,
                    titleSize: 24.sp,
                  ),
                  TextWidget(
                    title: AppStrings.createdAccount.tr(),
                    titleFontWeight: FontWeight.w400,
                    titleSize: 18.sp,
                  ),
                  SizedBox(height: 40.h,),
                  Loading()
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}
