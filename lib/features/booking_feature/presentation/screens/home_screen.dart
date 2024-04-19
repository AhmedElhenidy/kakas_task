import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../presentation_logic_holder/booking_cubit.dart';
import '../widget/service_element.dart';
import 'book_service_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key,});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    BookingCubit.get().getHomeProducts();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          final cubit = BookingCubit.get();
          return state is GetHomeDataLoading?
            Center(child: Loading(),)
          :
          ListView(
            children: [
              20.verticalSpace,
              GridView.builder(
                padding: EdgeInsets.only(
                    bottom: BookingCubit.get().totalValue== 0 ? 16 : 120.h
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16.h,
                  mainAxisExtent: 200.h,
                  crossAxisSpacing: 16.w,
                ),
                itemCount: cubit.products.length??0,
                itemBuilder: (BuildContext ctx, index) {
                  return ServiceElement(
                    product: cubit.products[index],
                    onServiceSelected: (serviceValue) {
                      BookingCubit.get().totalValue += serviceValue;
                      print(BookingCubit.get().totalValue);
                      setState(() {});
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
      floatingActionButton: BookingCubit.get().totalValue == 0 ? 0.verticalSpace : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ButtonWidget(
          color: AppColors.black,
          height: 70.h,
          child: Row(
            children: [
              19.horizontalSpace,
              TextWidget(
                title: AppStrings.total.tr(),
              ),
              TextWidget(
                title: "${BookingCubit.get().totalValue}",
                titleFontWeight: FontWeight.w700,
              ),
              TextWidget(
                title: AppStrings.egp.tr(),
              ),
              const Spacer(),
              ButtonWidget(
                color: AppColors.white,
                height: 50.h,
                horizontalPadding: 24,
                child: Row(
                  children: [
                    TextWidget(
                      title: AppStrings.continueString.tr(),
                      titleColor: AppColors.black,
                    ),
                    const Icon(Icons.arrow_forward),
                  ],
                ),
                onPressed: () {
                  navigateTo(BookServiceScreen());
                },
              ),
              16.horizontalSpace,
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}

