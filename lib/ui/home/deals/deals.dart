import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/ui/home/deals/deal_item.dart';

import '../../../utils/const_sizes.dart';
import '../../../widgets/text_display.dart';

class Deals extends StatelessWidget {
  const Deals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getBody();
  }

  _getBody() {
    AppTextDisplay dealsOfDay = AppTextDisplay(
      text: "Deals of the day",
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );

    Container categoriesTitles = Container(
      margin:
          EdgeInsets.symmetric(vertical: barMargin.h, horizontal: barMargin.w),
      height: categoriesTitlesHeight.h,
      child: dealsOfDay,
      alignment: Alignment.topLeft,
    );

    Container deals = Container(
      margin: EdgeInsets.only(left: barMargin.w),
      width: appBarWidth.w,
      child: Center(
        child: Consumer(
          builder: (context, watch, child) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: watch.watch(dealsProvider).deals.length,
                itemBuilder: (context, index) =>
                    DealItem(watch.watch(dealsProvider).deals[index],index));
          },
        ),
      ),
      height: 100.h,
    );

    return Column(
      children: [categoriesTitles, deals],
    );
  }
}
