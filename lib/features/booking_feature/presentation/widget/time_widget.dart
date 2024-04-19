import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../data/model/time_model.dart';

class TimeWidget extends StatelessWidget {
  final bool isSelected;
  final TimeModel time;
  const TimeWidget({required this.isSelected,required this.time,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 128.w,
      decoration: BoxDecoration(
          color: isSelected?AppColors.grey414141:AppColors.black1c1c1e,
          borderRadius: BorderRadius.circular(55),
          border: Border.all(
            color: isSelected?Colors.white:Colors.transparent,
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.check_circle,
            color: isSelected?Colors.white:AppColors.grey424243,
            size: 26.sp,
          ),
          TextWidget(
            title:time.time??'02:00 PM',
            titleColor: AppColors.white,
          ),
        ],
      ),
    );
  }
}