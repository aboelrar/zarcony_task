import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/utils/app_color.dart';
import 'package:zarcony_task/utils/const_sizes.dart';
import 'package:zarcony_task/widgets/text_display.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getBody();
  }

  _getBody() {
    Container offerImg = Container(
      width: offerImgWidth.w,
      height: offerImgHeight.h,
      decoration: BoxDecoration(
          color: AppColor.offerColor, borderRadius: BorderRadius.circular(10)),
    );

    Container title = Container(
      alignment: Alignment.centerLeft,
      height: 40.h,
      child: AppTextDisplay(
        text: "SOUQ",
        fontSize: 28.sp,
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
    );

    Container currentPrice = Container(
      width: 70.w,
      child: AppTextDisplay(
      text: "20 Egp",
      color: AppColor.firstColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    ),);

    AppTextDisplay perviousPrice = AppTextDisplay(
      text: "18 Egp",
      color: AppColor.whiteColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );

    Positioned line = Positioned(
        bottom: 8.h,
        child: Container(
          width: 40.w,
          height: 2.h,
          color: AppColor.whiteColor,
        ));

    Container discountPrice = Container(
      width: 80.w,
      margin: EdgeInsets.only(left: 10.w),
      child: Stack(
        children: [perviousPrice, line],
      ),
    );

    Container prices = Container(
      height: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [currentPrice, discountPrice],
      ),
    );

    Container productDuration = Container(
      alignment: Alignment.centerLeft,
      height: 40.h,
      child: AppTextDisplay(
        text: "product available until dec 2020",
        color: AppColor.whiteColor,
        fontSize: 10.sp,
        fontWeight: FontWeight.w800,
      ),
    );

    SizedBox offersDataColumn = SizedBox(
      width: 200.w,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [title, prices, productDuration],
    ),);

    Container offerItem = Container(
      margin: EdgeInsets.only(top: barMargin.h),
      width: offerItemWidth.w,
      height: offerItemHeight.h,
      child: Row(
        children: [offerImg, offersDataColumn],
      ),
      decoration: BoxDecoration(
          color: AppColor.offerColor, borderRadius: BorderRadius.circular(10)),
    );

    return offerItem;
  }
}
