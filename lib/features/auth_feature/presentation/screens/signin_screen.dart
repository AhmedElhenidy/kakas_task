import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_task/features/auth_feature/presentation/screens/register_screen.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit/auth_cubit.dart';
import '../widget/clique_stack.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h,),
                const CliqueStack(),
                Center(
                  child: TextWidget(
                    title: AppStrings.signIn.tr(),
                    titleFontWeight: FontWeight.w600,
                    titleSize: 36.sp,
                  ),
                ),
                SizedBox(height: 25.h,),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    final cubit=AuthCubit.get();
                    return Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          //phone
                          CustomFormField(
                            hint: AppStrings.username.tr(),
                            keyboardType: TextInputType.phone,
                            prefixIconWidget: ImageWidget(
                              imageUrl: AppAssets.phone,
                              width: 24.w,
                              height: 24.h,
                            ),
                            controller: cubit.signInPhoneController,
                          ),
                          SizedBox(height: 20.h,),
                          //password
                          CustomFormField(
                            hint: AppStrings.password.tr(),
                            keyboardType: TextInputType.text,
                            obscure: true,
                            prefixIconWidget: ImageWidget(
                              imageUrl: AppAssets.lock,
                              width: 24.w,
                              height: 24.h,
                            ),
                            controller: cubit.passwordController,
                          ),
                          SizedBox(height: 18.h,),
                          // ButtonWidget(
                          //   height: 25.h,
                          //   width: 180.w,
                          //   text: AppStrings.iForgotPassword.tr(),
                          //   textColor: Colors.white,
                          //   textSize: 16.sp,
                          //   color: Colors.transparent,
                          //   onPressed: () {
                          //     navigateTo(const ForgetPassScreen());
                          //   },
                          // ),
                          SizedBox(height: 40.h,),
                          ButtonWidget(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                cubit.signIn();
                              }
                            },
                            loading: state is LoadingState,
                            height: 58.h,
                            text: AppStrings.signIn.tr(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
            Column(
              children: [
                Row(
                    children: <Widget>[
                      const Expanded(
                          child: Divider(
                            color: AppColors.black585858,
                          )
                      ),
                      TextWidget(
                        title: AppStrings.haveNoAccount.tr(),
                        titleSize: 16.sp,
                        titleFontWeight: FontWeight.w700,
                      ),
                      const Expanded(
                          child: Divider(
                            color: AppColors.black585858,
                          )
                      ),
                    ]
                ),
                SizedBox(height: 29.h,),
                ButtonWidget(
                  outlined: true,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        BuildContext context) =>  RegisterScreen()));
                  },
                  height: 58.h,
                  text: AppStrings.signUp.tr(),
                ),
                30.verticalSpace,
              ],
            )
          ],
        ),
      ),
    );
  }
}
