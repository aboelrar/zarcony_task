import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zarcony_task/controller/address_controller.dart';
import 'package:zarcony_task/controller/cart_controller.dart';
import 'package:zarcony_task/controller/home_controller.dart';
import 'package:zarcony_task/ui/home/home_screen.dart';
import 'package:zarcony_task/utils/const_sizes.dart';

import 'controller/category_controller.dart';
import 'controller/deals_controller.dart';
import 'ui/home/cart/cart_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final cartProvider = ChangeNotifierProvider((ref) => CartController());
final addressProvider = ChangeNotifierProvider((ref) => AddressController());
final categoryProvider = ChangeNotifierProvider((ref) => CategoryController());
final dealsProvider = ChangeNotifierProvider((ref) => DealsController());
final homeProvider = ChangeNotifierProvider((ref) => HomeController());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
        designSize: const Size(appBarWidth, appBarHeight),
        builder: (context) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                // This is the theme of your application.
                //
                // Try running your application with "flutter run". You'll see the
                // application has a blue toolbar. Then, without quitting the app, try
                // changing the primarySwatch below to Colors.green and then invoke
                // "hot reload" (press "r" in the console where you ran "flutter run",
                // or simply save your changes to "hot reload" in a Flutter IDE).
                // Notice that the counter didn't reset back to zero; the application
                // is not restarted.
                primarySwatch: Colors.blue,
              ),
              home: const HomeScreen(),
            ));
  }
}
