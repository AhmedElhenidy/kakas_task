import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../app/utils/app_assets.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/image_widget.dart';
import '../../../bottom_navigation_feature/presentation/screens/bottom_navigation_screen.dart';

class CliqueStack extends StatelessWidget {
  const CliqueStack({super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 30.h,),
            Center(
              child: ImageWidget(
                imageUrl: AppAssets.kakasLogo,
                height: 200.59.h,
                width: 200.94.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
