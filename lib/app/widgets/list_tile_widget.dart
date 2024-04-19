import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_task/app/widgets/text_widget.dart';

import '../utils/app_colors.dart';
import 'image_widget.dart';

class ListTileWidget extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String? subtitle;
  final String leadingUrl;
  final Color? textButtonColor;
  final bool arrowIcon;
  final Widget? leading;

  const ListTileWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.leadingUrl,
    this.textButtonColor,
    this.arrowIcon = true,
    this.subtitle,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTap,
        leading: leading??ImageWidget(
          imageUrl: leadingUrl,
          width: 24.w,
          height: 24.h,
        ),
        minLeadingWidth: 0,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        title: TextWidget(
          title: title,
          titleSize: 18.sp,
          titleFontWeight: FontWeight.w700,
          titleColor: textButtonColor,
          titleAlign: TextAlign.start,
          titleMaxLines: 2,
        ),
        subtitle: subtitle == null
            ? null
            : TextWidget(
                title: subtitle ?? "",
                titleSize: 14.sp,
                titleFontWeight: FontWeight.w500,
                titleColor: textButtonColor,
                titleAlign: TextAlign.start,
              ),
        trailing: arrowIcon
            ? Icon(
                Icons.arrow_forward_ios,
                color: AppColors.white,
                size: 24.sp,
              )
            : null);
  }
}
