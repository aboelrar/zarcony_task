import 'package:flutter/cupertino.dart';
import 'package:zarcony_task/data/data.dart';
import 'package:zarcony_task/model/cart_model.dart';

class CartController extends ChangeNotifier {
  late List _cart = [];

  late int _totalItemPrice = 0;

  int get totalItemPrice => _totalItemPrice;

  List get cart => _cart;

  setCartList() async {
    await Data().getData("assets/json/cart.json").then(
        (value) => _cart = value.map((e) => CartModel.fromJson(e)).toList());

    await setTotalCartPrice();
    notifyListeners();
  }

  setQuantityAndPriceIncrease(index) {
    int quantity = int.parse(_cart[index].quantity);
    quantity++;

    int price = int.parse(_cart[index].price) * quantity;

    _cart[index].quantity = "$quantity";
    _cart[index].totalItemPrice = "$price";

    _totalItemPrice = _totalItemPrice + int.parse(_cart[index].price);

    notifyListeners();
  }

  setQuantityAndPriceDecrease(index) {
    int quantity = int.parse(_cart[index].quantity);

    print("quantity_is${quantity}");

    if (quantity > 1) {
      quantity--;

      int price = int.parse(_cart[index].price) * quantity;

      _cart[index].quantity = "$quantity";
      _cart[index].totalItemPrice = "$price";

      _totalItemPrice = _totalItemPrice - int.parse(_cart[index].price);

      notifyListeners();
    }
  }

  setTotalCartPrice() {
    _totalItemPrice = 0;

    for (int index = 0; index < _cart.length; index++) {
      _totalItemPrice += int.parse(_cart[index].totalItemPrice);
    }
    notifyListeners();
  }
}
