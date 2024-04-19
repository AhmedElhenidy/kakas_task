import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakas_task/features/booking_feature/data/model/product_model.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../data/model/home_model.dart';
import '../presentation_logic_holder/booking_cubit.dart';

class ServiceElement extends StatefulWidget {
  final void Function(num value) onServiceSelected;
  final ProductModel product;
  const ServiceElement({required this.onServiceSelected,
    required this.product,
    super.key});

  @override
  State<ServiceElement> createState() => _ServiceElementState();
}

class _ServiceElementState extends State<ServiceElement> {
  bool _isSelected = false;
  void toggleColorFilter() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            toggleColorFilter();
            widget.onServiceSelected(_isSelected?widget.product.price??0:-(widget.product.price??0));
            _isSelected? BookingCubit.get().selectedServicesIds.add(widget.product.id??0):
            BookingCubit.get().selectedServicesIds.remove(widget.product.id??0);
            // navigateTo(CalendarScreen());
            // check = true;
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 57.w,
            child: Stack(
              children: [
                ColorFiltered(
                  colorFilter: _isSelected
                      ?
                const ColorFilter.mode(Colors.transparent, BlendMode.color)
                      :
                  const ColorFilter.matrix([
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0.2126, 0.7152, 0.0722, 0, 0,
                    0,      0,      0,      1, 0,
                  ],),
                  child:  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 57.w,
                    backgroundImage: AssetImage(AppAssets.kakasLogo)
                  ),
                ),
                if(_isSelected) Container(
                  width: 114.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                      width: 12.sp
                    )
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
          ),
        ),
        10.verticalSpace,
         TextWidget(
          title: widget.product.title??"Service Name",
        ),
        4.verticalSpace,
        TextWidget(title: '${widget.product.price??100} EGP'),
      ],
    );
  }
}