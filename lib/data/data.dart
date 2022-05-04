// ignore: library_prefixes
import 'dart:convert';

import 'package:flutter/services.dart' as rootBundle;

import '../model/cart_model.dart';

class Data {
  Future<List> getData(String jsonFile) async {
    final productData = await rootBundle.rootBundle.loadString(jsonFile);

    final list = json.decode(productData) as List<dynamic>;

    return list;
  }
}
