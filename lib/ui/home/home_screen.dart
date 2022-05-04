import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:zarcony_task/components/bottom_navigation_bar.dart';
import 'package:zarcony_task/components/top_app_bar.dart';
import 'package:zarcony_task/controller/cart_controller.dart';
import 'package:zarcony_task/main.dart';
import 'package:zarcony_task/ui/home/cart/cart_screen.dart';
import 'package:zarcony_task/ui/home/deals/deals.dart';
import 'package:zarcony_task/ui/home/offers/offers.dart';
import 'package:zarcony_task/utils/app_color.dart';

import '../../utils/const_sizes.dart';
import 'address/address.dart';
import 'categories/categories.dart';
import 'home_body.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //CALL Data
    ref.read(cartProvider).setCartList();
    ref.read(addressProvider).setAddressList();
    ref.read(categoryProvider).setCategoryList();
    ref.read(dealsProvider).setDealsList();

    // TODO: implement build
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(child: HomeBody())),
      bottomNavigationBar: BottomNavigationBarCustom(ref),
    );
  }
}
