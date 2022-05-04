import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/model/cart_model.dart';

import '../../../utils/app_color.dart';
import '../../../utils/const_sizes.dart';
import '../../../utils/hex_color.dart';
import '../../../widgets/text_display.dart';

class CartItem extends ConsumerWidget {
  CartModel? cartModel;
  int? index;

  CartItem(this.cartModel, this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return _getBody(ref);
  }

  _getBody(WidgetRef ref) {
    Container categoryImg = Container(
      width: cartImgWidth.w,
      height: cartImgHeight.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(cartImgRadius.r),
          color: HexColor(cartModel!.color!)),
    );

    Container itemTitle = Container(
      height: 23.h,
      child: AppTextDisplay(
        text: cartModel!.title!,
        fontSize: 14.0.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.blackColor,
      ),
    );

    Container itemGrams = Container(
      height: 23.h,
      child: AppTextDisplay(
        text: cartModel!.weight,
        color: Colors.grey,
        fontSize: 11.sp,
      ),
    );

    Container itemPrice = Container(
      height: 23.h,
      child: AppTextDisplay(
        text: "${cartModel!.totalItemPrice} Egp",
        fontSize: 14.sp,
        color: AppColor.firstColor,
      ),
    );

    Container cartInfoData = Container(
      width: 130.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [itemTitle, itemGrams, itemPrice],
      ),
    );

    GestureDetector decreaseQuantity = GestureDetector(
      key: Key("minus$index"),
      onTap: () => ref.read(cartProvider).setQuantityAndPriceDecrease(index),
      child: Container(
        width: cartQuantityW.w,
        height: cartQuantityH.h,
        alignment: Alignment.center,
        child: AppTextDisplay(
          text: "-",
          color: AppColor.blueColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cartQuantityR.sm),
            color: AppColor.lightBlueColor),
      ),
    );

    SizedBox itemQuantity = SizedBox(
      width: 30.w,
      child: AppTextDisplay(
        text: cartModel!.quantity,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );

    GestureDetector increaseQuantity = GestureDetector(
      key: Key("plus$index"),
      onTap: () => ref.read(cartProvider).setQuantityAndPriceIncrease(index),
      child: Container(
        width: cartQuantityW.w,
        height: cartQuantityH.h,
        alignment: Alignment.center,
        child: AppTextDisplay(
          text: "+",
          color: AppColor.blueColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(cartQuantityR.sm),
            color: AppColor.lightBlueColor),
      ),
    );

    Row quantityRow = Row(
      children: [decreaseQuantity, itemQuantity, increaseQuantity],
    );

    Row cartRow = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [categoryImg, cartInfoData, quantityRow]);

    return Container(
        height: 70.h, margin: EdgeInsets.only(top: 30.h), child: cartRow);
  }
}
