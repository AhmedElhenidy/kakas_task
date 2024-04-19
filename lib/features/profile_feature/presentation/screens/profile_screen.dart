import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_alert_dialog.dart';
import '../../../../app/widgets/draggable_scrollable_widget.dart';
import '../../../../app/widgets/list_tile_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/screens/signin_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsetsDirectional.only(top: 25.h,start: 40.w,end: 40.w),
        child: Column(
          children: [
            CircleAvatar(
              radius: 65.5.h,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AppImages.logo),
            ),
            TextWidget(
              title:"Ahmed Mohamed",
              titleFontWeight: FontWeight.w700,
              titleSize: 22.sp,
            ),
            SizedBox(height: 6.h,),
            TextWidget(
              title: "+201552630268",
              titleFontWeight: FontWeight.w400,
              titleSize: 22.sp,
            ),
            SizedBox(height: 20.h,),
            const Divider(height: 0,),
            SizedBox(height: 36.h,),
            ListTileWidget(
              onTap: () { },
              title: AppStrings.editProfile.tr(),
              leadingUrl: AppAssets.editProfile,
            ),
            ListTileWidget(
              onTap: () { },
              title: AppStrings.about.tr(),
              leadingUrl: AppAssets.help,
            ),
            ListTileWidget(
              onTap: () { },
              title: AppStrings.contactUs.tr(),
              leadingUrl: AppAssets.support,
            ),
            ListTileWidget(
              onTap: () {},
              title: AppStrings.termsAndConditions.tr(),
              leadingUrl: AppAssets.dashboard,
            ),
            ListTileWidget(
              onTap: () {
                showScrollableWidget(
                  Container(
                      height: 225.h,
                      decoration: BoxDecoration(
                        color: AppColors.black262626,
                        borderRadius: BorderRadius.circular(15.sp),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextWidget(
                              title: AppStrings.selectLanguage.tr(),
                              titleFontWeight: FontWeight.w600,
                              titleSize: 24.sp,
                            ),
                            SizedBox(height: 22.h,),
                            ButtonWidget(
                              outlined: true,
                              width: 293.w,
                              text: AppStrings.english,
                              onPressed: (){
                                if(context.locale.languageCode!="en"){
                                  context.setLocale(const Locale("en"));
                                }
                                goBack();
                              },
                            ),
                            SizedBox(height: 9.h,),
                            ButtonWidget(
                              outlined: true,
                              width: 293.w,
                              text: AppStrings.arabic,
                              onPressed: (){
                                if(context.locale.languageCode!="ar"){
                                  context.setLocale(const Locale("ar"));
                                }
                                goBack();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                );
              },
              title: AppStrings.language.tr(),
              leadingUrl: AppAssets.language,
            ),
            ListTileWidget(
              onTap: () {
                globalAlertDialogue(
                  AppStrings.logout.tr(),
                  buttonText2: "yes".tr(),
                  buttonText: "No".tr(),
                  iconData: Icons.help_center_outlined,
                  canCancel: true,
                  onOk: () {
                    getIt<CacheService>().clear().then((value) =>   navigateTo(SignInScreen(),removeAll: true,));
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                );
              },
              title: AppStrings.logout.tr(),
              leadingUrl: AppAssets.exit,
              textButtonColor: AppColors.red3659,
            ),
            ListTileWidget(
              onTap: () {
                globalAlertDialogue(
                  AppStrings.deleteAccount.tr(),
                  buttonText2: "yes".tr(),
                  buttonText: "No".tr(),
                  canCancel: true,
                  iconData: Icons.help_center_outlined,
                  onOk: () {
                    // AccountCubit.get(context).deleteAccount();
                  },
                  onCancel: () {
                    Navigator.pop(context);
                  },
                );
              },
              leadingUrl: "",
              title: AppStrings.deleteAccount.tr(),
              leading: Icon(Icons.delete_outline_outlined,color: AppColors.red3659,),
              textButtonColor: AppColors.red3659,
            ),
          ],
        ),
      ),
    );
  }
}
