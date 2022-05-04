import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/ui/home/cart/cart_item.dart';
import 'package:zarcony_task/utils/app_color.dart';
import 'package:zarcony_task/utils/const_sizes.dart';
import 'package:zarcony_task/widgets/text_display.dart';

import '../../../components/top_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getContent(context);
  }

  _getContent(context) {
    Container cartTitle = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: barMargin.h, left: barMargin.w),
      child: AppTextDisplay(
        text: "Cart",
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColor.blackColor,
      ),
    );

    Container cartList = Container(
        height: 500.h,
        child: Consumer(
          builder: (context, watch, child) {
            return ListView.builder(
                itemCount: watch.watch(cartProvider).cart.length,
                itemBuilder: (context, index) =>
                    CartItem(watch.watch(cartProvider).cart[index], index));
          },
        ));

    return Column(
      children: [const TopAppBar(), cartTitle, cartList],
    );
  }
}
