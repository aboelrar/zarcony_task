import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/utils/app_color.dart';
import 'package:zarcony_task/utils/hex_color.dart';

import '../../../model/category_model.dart';
import '../../../utils/const_sizes.dart';
import '../../../widgets/text_display.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel? categoryModel;

  CategoryItem(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _getBody();
  }

  _getBody() {
    Container categoryImg = Container(
      width: categorySize.w,
      height: categorySize.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.sm),
          color: HexColor(categoryModel!.color!)),
    );

    Container categoryTitle = Container(
      height: 20.h,
      child: AppTextDisplay(
      text: categoryModel!.title,
      fontSize: 14.sp,
    ),);

    Column categoryItemColumn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [categoryImg, categoryTitle],
    );

    return Container(
        margin: EdgeInsets.only(right: 15.w), child: categoryItemColumn);
  }
}
