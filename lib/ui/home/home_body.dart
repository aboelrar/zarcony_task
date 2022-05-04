import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../components/top_app_bar.dart';
import '../../main.dart';
import '../../utils/app_color.dart';
import '../../utils/const_sizes.dart';
import 'address/address.dart';
import 'cart/cart_screen.dart';
import 'categories/categories.dart';
import 'deals/deals.dart';
import 'offers/offers.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer(builder: (context, watch, child) {
      if (watch.watch(homeProvider).bottomStatus == 3) {
        return const CartScreen();
      } else {
       return _getContent();
      }
    });
  }

  Column _getContent() {
    SizedBox search = SizedBox(
      width: boxShareWidth.w,
      height: boxShareHeight.h,
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            filled: true,
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: AppColor.blackColor,
            ),
            hintStyle: TextStyle(color: AppColor.blackColor, fontSize: 11.sp),
            hintText: "search in thousands of products",
            fillColor: AppColor.greyLightColor),
      ),
    );

    return Column(
      children: [
        const TopAppBar(),
        search,
        const Address(),
        const Categories(),
        const Deals(),
        const Offers(),
      ],
    );
  }
}
