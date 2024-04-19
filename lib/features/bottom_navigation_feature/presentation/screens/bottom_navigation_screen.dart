
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';

import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/clique_app_bar_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../booking_feature/presentation/screens/add_product_screen.dart';
import '../../../booking_feature/presentation/screens/home_screen.dart';
import '../../../profile_feature/presentation/screens/profile_screen.dart';

class CliqueBottomNavigation extends StatefulWidget {
  const CliqueBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CliqueBottomNavigation> createState() => _CliqueBottomNavigationState();
}

class _CliqueBottomNavigationState extends State<CliqueBottomNavigation> {
  int tabIndex = 0;

  void changeTabIndex(int index) {
    tabIndex = index;
    setState(() {});
  }

  final List<Widget> _body = [
    const HomeScreen(),
    const AddProductScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CliqueAppBarWidget(
        title: tabIndex == 0
            ? AppStrings.home.tr()
            : tabIndex == 1
                ? AppStrings.myBookings.tr()
                : AppStrings.myProfile.tr(),
      ),
      resizeToAvoidBottomInset: false,
      body: _body[tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        unselectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
        ),
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.white,
        selectedLabelStyle: TextStyle(
          color: AppColors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
        ),
        type: BottomNavigationBarType.fixed,
        onTap: changeTabIndex,
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  ImageWidget(
                    imageUrl: AppAssets.home,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                ],
              ),
              label: AppStrings.home.tr()),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  ImageWidget(
                    imageUrl: AppAssets.myBooking,
                    width: 24.w,
                    height: 24.h,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                ],
              ),
              label: AppStrings.products.tr()),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  ImageWidget(
                    imageUrl: AppAssets.profile,
                    width: 21.33.w,
                    height: 26.67.h,
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                ],
              ),
              label: AppStrings.profile.tr()),
        ],
      ),
    );
  }
}
