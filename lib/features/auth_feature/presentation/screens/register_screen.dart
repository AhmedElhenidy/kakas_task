import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_task/features/auth_feature/presentation/screens/signin_screen.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/auth_cubit/auth_cubit.dart';
import '../widget/clique_stack.dart';

class RegisterScreen extends StatelessWidget {
  final bool isFromBookService;

   RegisterScreen({super.key, this.isFromBookService = false});
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
                  children: [
                    SizedBox(
                      height: 60.h,
                    ),
                    const CliqueStack(),
                    TextWidget(
                      title: isFromBookService
                          ? AppStrings.registerFirst.tr()
                          : AppStrings.createYourAccount.tr(),
                      titleFontWeight: FontWeight.w600,
                      titleSize: 36.sp,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        final cubit=AuthCubit.get();
                        return Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // name
                              CustomFormField(
                                hint: AppStrings.username.tr(),
                                keyboardType: TextInputType.phone,
                                prefixIconWidget: ImageWidget(
                                  imageUrl: AppAssets.phone,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                                controller: cubit.nameController,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
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
                                controller: cubit.singUpPasswordController,
                              ),
                              64.verticalSpace,
                              ButtonWidget(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    cubit.signUp();
                                  }
                                },
                                loading: state is SignUpLoadingState,
                                height: 58.h,
                                text: AppStrings.registerNow.tr(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 48.h,
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextWidget(
                      title: AppStrings.haveAccount.tr(),
                      titleFontWeight: FontWeight.w700,
                      titleSize: 16.sp,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ButtonWidget(
                      outlined: true,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SignInScreen()));
                      },
                      height: 58.h,
                      text: AppStrings.signIn.tr(),
                    ),
                    30.verticalSpace,
                  ],
                )
              ],
            )));
  }
}
