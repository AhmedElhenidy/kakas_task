import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/utils/app_colors.dart';
import '../../app/utils/helper.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? header;
  final double? width;
  final double? height;
  final bool? obscure;
  final String? labelText;
  final IconData? suffixIcon;
  final Widget? suffixIconWidget;
  final IconData? prefixIcon;
  final Widget? prefixIconWidget;
  final Color? labelColor;
  final Function(String)? onChange;
  final Function()? iconPressed;
  final GestureTapCallback? onPressed;
  final bool? enabled;
  final TextAlign? align;
  final FocusNode? focusNode;
  final int? maxLines;
  final int? minLines;
  final Color? color;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadiusGeometry? borderRadius;
  final double? borderRadiusValue;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;

  const CustomFormField({
    super.key,
    this.controller,
    this.hint = "",
    this.width,
    this.height,
    this.obscure = false,
    this.header,
    this.labelText,
    this.suffixIcon,
    this.suffixIconWidget,
    this.enabled = true,
    this.labelColor,
    this.onPressed,
    this.align,
    this.prefixIcon,
    this.prefixIconWidget,
    this.focusNode,
    this.maxLines,
    this.minLines,
    this.iconPressed,
    this.color,
    this.onChange,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.contentPadding,
    this.borderRadius,
    this.borderRadiusValue,
    this.enabledBorder,
    this.focusedBorder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header == null
            ? const SizedBox()
            : Text(
                header ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black1D1D1D,
                    fontSize: 14.sp),
              ),
        SizedBox(
          height: header == null ? 0 : 13.h,
        ),
        InkWell(
          onTap: onPressed,
          child: Container(
            height: height ,
            width: width ?? (MediaQuery.of(context).size.width),
            // padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(12),
              color: color ?? AppColors.black262626,
            ),
            child: TextFormField(
              cursorColor: AppColors.black,
              validator: validator ??
                      (value) {
                    if (value!.isEmpty) {
                      return "Field Required".tr();
                    }
                    return null;},
              textInputAction: textInputAction,
              controller: controller,
              minLines: minLines ?? 1,
              maxLines: maxLines ?? 1,
              enabled: enabled,
              keyboardType: keyboardType,
              focusNode: focusNode,
              onChanged: onChange,
              obscureText: obscure ?? false,
              textAlign: align ?? TextAlign.start,
              style: TextStyle(
                height: 1.2.h,
                fontFamily: fontMedium,
                color: AppColors.white,
                fontSize: 16.sp,
              ),
              cursorHeight: 24.h,
              decoration: InputDecoration(
                contentPadding: contentPadding??EdgeInsets.only(top: 20.h),
                errorStyle: TextStyle(
                  fontSize: 12.sp,
                  height: 0.5.h,
                  color: AppColors.red3659
                ),
                enabledBorder: enabledBorder ?? InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedBorder: focusedBorder ?? OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadiusValue??100),
                        borderSide: const BorderSide(color: AppColors.white,)),
                hintText: hint ?? "",
                hintStyle: TextStyle(
                  height: 1.2.h,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Regular",
                  color: AppColors.blackBCBCBC,
                ),
                labelText: labelText,
                labelStyle: TextStyle(
                  fontSize: 14.sp,
                  color: labelColor ?? AppColors.grey9A9A9A,
                  fontFamily: fontRegular,
                ),
                suffixIcon: suffixIconWidget == null
                    ? (suffixIcon == null
                        ? null
                        : InkWell(
                            onTap: iconPressed ?? () {},
                            child: Icon(
                              suffixIcon,
                              size: 18,
                              color: AppColors.white,
                            )))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          suffixIconWidget!,
                        ],
                      ),
                prefixIcon: prefixIconWidget == null
                    ? (prefixIcon == null
                        ? null
                        : Icon(
                            prefixIcon,
                            size: 20.sp,
                            color: Colors.white,
                          ))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          prefixIconWidget!,
                          SizedBox(
                            width: 16.h,
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
