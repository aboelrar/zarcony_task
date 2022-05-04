import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/utils/app_color.dart';
import 'package:zarcony_task/widgets/text_display.dart';

import '../utils/const_sizes.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getBody();
  }

  _getBody() {
    Icon barIcon =  Icon(
      Icons.location_on_outlined,
      color: Colors.white,
      size: 15.sm,
    );

    AppTextDisplay title = AppTextDisplay(
      text: "Mustafa st",
      color: Colors.white,
      fontSize: 13.sp,
    );

    Container barTitle = Container(
      padding: EdgeInsets.only(left: 10.w,right: 20.w ),
      height: barTitleHeight.h,
//      width: barTitleWidth.w,
      decoration: const BoxDecoration(
          color: AppColor.firstColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              bottomLeft: Radius.circular(40.0),
              topRight: Radius.circular(70.0),
          bottomRight: Radius.circular(30.0))),
      child: Row(
        children: [barIcon, title],
      ),
    );

    Container barImg = Container(
        height: 35.h,
        width: 35.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColor.blackColor, // red as border color
          ),
        ));

    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: barMargin.w, vertical: barMargin.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [barTitle, barImg],
      ),
    );
  }
}
