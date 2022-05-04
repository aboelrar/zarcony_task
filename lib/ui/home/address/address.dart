import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/ui/home/address/address_item.dart';
import 'package:zarcony_task/utils/const_sizes.dart';

import '../../../model/address_model.dart';

class Address extends StatelessWidget {
  const Address({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(left: barMargin.w, top: barMargin.h),
      height: addressHeight.h,
      width: appBarWidth.w,
      child: Center(
        child: Consumer(
          builder: (context, watch, child) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: watch.watch(addressProvider).address.length,
                itemBuilder: (context, index) =>
                    AddressItem(watch.watch(addressProvider).address[index]));
          },
        ),
      ),
    );
  }
}
