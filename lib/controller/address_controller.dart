import 'package:flutter/cupertino.dart';
import 'package:zarcony_task/model/address_model.dart';

import '../data/data.dart';

class AddressController extends ChangeNotifier {
  late List _address = [];

  List get address => _address;

  setAddressList() async {
    await Data().getData("assets/json/address.json").then((value) =>
        _address = value.map((e) => AddressModel.fromJson(e)).toList());
    notifyListeners();
  }
}
