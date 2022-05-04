import 'package:flutter/cupertino.dart';

import '../data/data.dart';
import '../model/category_model.dart';

class CategoryController extends ChangeNotifier {
  late List _category = [];

  List get category => _category;

  setCategoryList() async {
    await Data().getData("assets/json/category.json").then((value) =>
        _category = value.map((e) => CategoryModel.fromJson(e)).toList());
    notifyListeners();
  }
}
