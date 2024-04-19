import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../data/model/barber_model.dart';

class BarberElement extends StatelessWidget {
  final bool isSelected;
  final BarberModel barber;
  final Color? color;

  const BarberElement({
    required this.isSelected,
    required this.barber,
    super.key,
    this.color = AppColors.black262626,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.black1c1c1e,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 14.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.sp),
          color: color,
        ),
        width: 146.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ColorFiltered(
                  colorFilter: isSelected
                      ? const ColorFilter.mode(
                          Colors.transparent, BlendMode.color)
                      : const ColorFilter.matrix(
                          [
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0.2126,
                            0.7152,
                            0.0722,
                            0,
                            0,
                            0,
                            0,
                            0,
                            1,
                            0,
                          ],
                        ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ImageWidget(
                      imageUrl: barber.image??AppImages.barber,
                      fit: BoxFit.fill,
                      width: 120.w,
                      height: 120.w,
                    ),
                  ),
                ),
                if (isSelected)
                  Container(
                    width: 120.w,
                    height: 120.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white.withOpacity(0.2),
                        width: 12.sp,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.check,
                        color: AppColors.white,
                        size: 50.sp,
                      ),
                    ),
                  ),
              ],
            ),
            8.verticalSpace,
            TextWidget(
              title: barber.name??'Ayman',
              titleSize: 16.sp,
              titleFontWeight: FontWeight.w700,
            ),
            4.verticalSpace,
          ],
        ),
      ),
    );
  }
}
