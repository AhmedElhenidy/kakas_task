import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/ui_helpers.dart';
import 'image_widget.dart';

class DefaultAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String? title;
  final bool actions;
  final VoidCallback? onPop;
  final bool canBack;
  const DefaultAppBarWidget(
      {this.title,
      this.actions = false,
      Key? key,
      this.onPop,
      this.canBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: canBack
          ? IconButton(
              onPressed: onPop ??
                  () {
                    UIHelpers.removeKeyboard();
                    Navigator.pop(context);
                  },
              icon: Container(
                width: 28.w,
                height: 28.w,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.white,
                      width: 1,
                    )),
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 28.sp,
                ),
              ),
            )
          : const SizedBox(),
      title: title == null
          ? null
          : Text(
              title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24.sp,
              ),
            ),
      actions: actions
          ? [
              const SizedBox(
                width: 32,
              ),
              InkWell(
                onTap: () {
                  // navigateTo(LoginScreen(),removeAll: true);
                },
                child: ImageWidget(
                  imageUrl: "AppAssets.drawer",
                  height: 43.w,
                  width: 43.w,
                ),
              ),
              const SizedBox(
                width: 32,
              ),
            ]
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(500, 56);
}
