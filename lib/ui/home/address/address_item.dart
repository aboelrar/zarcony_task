import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/utils/app_color.dart';

import '../../../model/address_model.dart';
import '../../../utils/const_sizes.dart';
import '../../../widgets/text_display.dart';

class AddressItem extends StatelessWidget {
  AddressModel? addressModel;

  AddressItem(this.addressModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getBody();
  }

  _getBody() {
    Container addressImg = Container(
      width: addressImgWidth.w,
      height: addressImgHeight.h,
      decoration: BoxDecoration(
          color: const Color(0xffE3DDD6),
          borderRadius: BorderRadius.circular(10.sm)),
    );

    Container homeAddress = Container(
      height: 18.h,
      child: AppTextDisplay(
          text: addressModel!.addressTitle,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600),
    );

    Container address = Container(
      height: 18.h,
      child: AppTextDisplay(
        text: addressModel!.address,
        fontSize: 12.sp,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );

    Container floor = Container(
      height: 18.h,
      child: AppTextDisplay(
        text: addressModel!.place,
        fontSize: 12.sp,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );

    Flexible addressInfoColumn = Flexible(
        child: Container(
      width: 100.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [homeAddress, address, floor],
      ),
    ));

    Row addressRow = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [addressImg, addressInfoColumn],
    );

    Container addressItem = Container(
      margin: EdgeInsets.only(right: addressMarginRight.w),
      width: addressItemWidth.w,
      height: addressItemHeight.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.sm),
        color: AppColor.whiteColor,
        boxShadow: const [
          BoxShadow(color: Colors.grey, spreadRadius: .5),
        ],
      ),
      child: addressRow,
    );

    return addressItem;
  }
}
