import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/utils/app_color.dart';
import 'package:zarcony_task/utils/hex_color.dart';
import 'package:zarcony_task/widgets/text_display.dart';

import '../../../model/deals_model.dart';
import '../../../utils/const_sizes.dart';

class DealItem extends ConsumerWidget {
  DealsModel? dealsModel;
  int? index;

  DealItem(this.dealsModel, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return _getBody(ref);
  }

  _getBody(WidgetRef ref) {
    GestureDetector barImg = GestureDetector(
      onTap: () {
        ref
            .read(dealsProvider)
            .setFavItem(index, dealsModel!.favStatus! == 1 ? 0 : 1);
      },
      child: Container(
        height: barImgHeight.h,
        width: barImgWidth.w,
        child: Icon(
          Icons.favorite,
          size: favIconSize,
          color: dealsModel!.favStatus! == 1 ? Colors.red : Colors.grey,
        ),
        decoration: const BoxDecoration(
            color: AppColor.whiteColor, shape: BoxShape.circle),
      ),
    );

    Container dealImg = Container(
      width: dealImgSize,
      height: dealImgSize,
      decoration: BoxDecoration(
          color: HexColor(dealsModel!.color!),
          borderRadius: BorderRadius.circular(10.0)),
    );

    Stack dealImgFav = Stack(
      children: [dealImg, Positioned(top: 0, left: 0, child: barImg)],
    );

    Container dealTitle = Container(
      height: 20.h,
      child: AppTextDisplay(
        text: dealsModel!.title,
        color: AppColor.blackColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
        maxLines: 1,
      ),
    );

    Container dealPieces = Container(
      height: 20.h,
      child: AppTextDisplay(
        text: dealsModel!.pieces,
        color: AppColor.blackColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      ),
    );

    Icon locationAddress = Icon(
      Icons.location_on_outlined,
      size: 13.sm,
    );

    AppTextDisplay dealAddress = AppTextDisplay(
      text: dealsModel!.duration,
      color: AppColor.blackColor,
      fontSize: 11.sp,
    );

    Container addressRow = Container(
      height: 20.h,
      child: Row(
        children: [locationAddress, dealAddress],
      ),
    );

    Container currentPrice = Container(
        height: 20.h,
        child: AppTextDisplay(
          text: dealsModel!.currentPrice!,
          color: AppColor.firstColor,
          fontSize: 13.sp,
        ));

    AppTextDisplay perviousPrice = AppTextDisplay(
      text: dealsModel!.previousPrice!,
      color: Colors.grey,
      fontSize: 13.sp,
    );

    Positioned line = Positioned(
        bottom: 8.h,
        child: Container(
          width: discountLineWidth.w,
          height: discountLineHeight.h,
          color: Colors.grey,
        ));

    Container discountPrice = Container(
      margin: EdgeInsets.only(left: 15.w),
      child: Stack(
        children: [perviousPrice, line],
      ),
    );

    Row prices = Row(
      children: [currentPrice, discountPrice],
    );

    Flexible dealInfoColumn = Flexible(
      child: Container(
        width: 160.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [dealTitle, dealPieces, addressRow, prices],
        ),
      ),
    );

    Row dealRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [dealImgFav, dealInfoColumn],
    );

    return Container(
        width: 255.w, margin: EdgeInsets.only(right: 30.w), child: dealRow);
  }
}
