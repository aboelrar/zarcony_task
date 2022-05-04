import 'package:flutter/cupertino.dart';
import 'package:zarcony_task/model/address_model.dart';
import 'package:zarcony_task/model/deals_model.dart';

import '../data/data.dart';

class DealsController extends ChangeNotifier {
  late List _deals = [];

  List get deals => _deals;

  setDealsList() async {
    await Data().getData("assets/json/deals.json").then(
        (value) => _deals = value.map((e) => DealsModel.fromJson(e)).toList());
    notifyListeners();
  }

  setFavItem(index, status) {
    _deals[index].favStatus = status;
    notifyListeners();
  }
}
