import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/ui/home/categories/category_item.dart';

import '../../../utils/const_sizes.dart';
import '../../../widgets/text_display.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getBody(context);
  }

  _getBody(context) {
    Container exploreCategory = Container(
      width: 200.w,
      alignment: Alignment.centerLeft,
      child: AppTextDisplay(
      text: "Explore By Category",
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    ),);

    Container seeAll = Container(
      width: 100.w,
      child: AppTextDisplay(
      text: "See All(5)",
      fontSize: 13.sp,
    ),);

    Container categoriesTitles = Container(
      margin:
          EdgeInsets.symmetric(vertical: barMargin.h, horizontal: barMargin.w),
      height: categoriesTitlesHeight.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [exploreCategory, seeAll],
      ),
    );

    Container categoryList = Container(
      margin: EdgeInsets.only(left: barMargin.w),
      height: categoriesListHeight.h,
      child: Consumer(
        builder: (context, watch, child) {
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: watch.watch(categoryProvider).category.length,
              itemBuilder: (context, index) =>  CategoryItem(watch.watch(categoryProvider).category[index]));
        },
      ),
    );

    Column categoriesColumn = Column(
      children: [categoriesTitles, categoryList],
    );

    return categoriesColumn;
  }
}
