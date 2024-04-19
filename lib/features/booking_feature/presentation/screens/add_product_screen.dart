import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../app/services/image_picker_service/image_picker_service.dart';
import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_fonts.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/custom_form_field.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/booking_cubit.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {

  final priceController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  XFile? userImage;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    physics:const BouncingScrollPhysics(),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //product name
                          CustomFormField(
                            hint: AppStrings.title.tr(),
                            prefixIconWidget: ImageWidget(
                              imageUrl: AppAssets.hash,
                              width: 24.w,
                              height: 24.h,
                            ),
                            controller: nameController,
                          ),
                          16.verticalSpace,
                          //product price
                          CustomFormField(
                            hint: AppStrings.price.tr(),
                            keyboardType: TextInputType.number,
                            prefixIconWidget: ImageWidget(
                              imageUrl: AppAssets.creditCard,
                              width: 24.w,
                              height: 24.h,
                            ),
                            controller: priceController,
                          ),
                          16.verticalSpace,
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16),
                                        )
                                    ),
                                    //height: 200.h,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 20.h
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        TextWidget(
                                          title: "chosePicture".tr(),
                                          titleAlign: TextAlign.center,
                                          titleSize: 20.sp,
                                          titleFontWeight: FontWeight.w600,
                                          fontFamily: AppFonts.regular,
                                          titleColor: Colors.black,
                                        ),
                                        20.verticalSpace,
                                        Row(
                                          mainAxisAlignment : MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed:() async{
                                                Navigator.pop(context);
                                                await ImagePickerService.getImage(imageSource: ImageSource.camera).then((value) {
                                                  if(value != null){
                                                    userImage = value;
                                                    setState(() {

                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.camera_alt_rounded,
                                                color: Colors.black,
                                                size:25.sp ,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed:()async {
                                                Navigator.pop(context);
                                                await ImagePickerService.getImage(imageSource: ImageSource.gallery).then((value) {
                                                  if(value != null){
                                                    userImage = value;
                                                    setState(() {
                                                    });
                                                  }
                                                });
                                              },
                                              icon: Icon(
                                                Icons.photo_library_rounded,
                                                color: Colors.black,
                                                size:25.sp ,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              width: 1.sw,
                              height: 200.h,
                              decoration: BoxDecoration(
                                color:  const Color(0xFF455A64),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: userImage==null? Icon(
                                Icons.camera_alt_outlined,
                                size: 30.sp,
                                color: Colors.white,
                              ):
                              Image.file(File(userImage!.path),fit: BoxFit.fill,),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ButtonWidget(
                    text:"add_product".tr(),
                    loading:  state is AddProductLoading,
                    onPressed:() {
                      if(formKey.currentState!.validate()&&userImage!=null){
                        BookingCubit.get().addProduct(nameController.text,int.tryParse(priceController.text)??0,File(userImage!.path));
                      }
                    },
                  ),
                ),
                33.verticalSpace,
              ],
            );
        },
      ),
    );
  }
}
