import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/widgets/text_display.dart';

import '../utils/app_color.dart';
import '../utils/const_sizes.dart';

class BottomNavigationBarCustom extends StatelessWidget {
  WidgetRef? ref;

  BottomNavigationBarCustom(this.ref);

  @override
  Widget build(
    BuildContext context,
  ) {
    this.ref = ref;
    // TODO: implement build
    return _getBody(context);
  }

  _getBody(context) {
    var barWidth = MediaQuery.of(context).size.width;

    SizedBox firstPart = SizedBox(
      width: 140.w,
      height: 60.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _barItem(Icons.home_outlined, "Grocery", 0),
          _barItem(Icons.notifications_none_sharp, "News", 1)
        ],
      ),
    );

    SizedBox secondPart = SizedBox(
      width: 140.w,
      height: 60.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _barItem(Icons.favorite_border, "Favourites", 2),
          _barItem(Icons.add_shopping_cart, "Cart", 3)
        ],
      ),
    );

    Container barData = Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 30.h),
      height: bottomBarDataH.h,
      width: barWidth,
      color: AppColor.greyLightColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [firstPart, secondPart],
      ),
    );

    Container bottomBar = Container(
      height: bottomBarH.h,
      width: barWidth,
      color: AppColor.whiteColor,
      child: barData,
    );

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        bottomBar,
        _totalPriceCart(),
      ],
    );
  }

  _barItem(icon, text, status) {
    Consumer item = Consumer(builder: (context, watch, child) {
      Color itemColor = status == watch.watch(homeProvider).bottomStatus
          ? AppColor.firstColor
          : Colors.grey;
      return Column(
        children: [
          Icon(
            icon,
            color: itemColor,
          ),
          AppTextDisplay(
            text: text,
            color: itemColor,
          )
        ],
      );
    });

    return GestureDetector(
        key: Key("nanKey$status"),
        onTap: () => ref!.read(homeProvider).setBottomStatus(status),
        child: item);
  }

  _totalPriceCart() {
    Consumer totalPrice = Consumer(builder: (context, watch, child) {
      return Container(
        height: 15.h,
        child: AppTextDisplay(
          text: "\$${watch.watch(cartProvider).totalItemPrice}",
          color: AppColor.whiteColor,
          fontSize: 10.sp,
        ),
      );
    });

    Icon shopIcon =  Icon(
      Icons.shopping_cart_outlined,
      color: AppColor.whiteColor,
      size: 25.sm,
    );

    Container oval = Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 10.h),
      height: 65.h,
      width: 60.h,
      decoration: const BoxDecoration(
        color: AppColor.orangeCart,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [totalPrice, shopIcon],
      ),
    );

    return oval;
  }
}
