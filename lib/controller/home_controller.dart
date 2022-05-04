import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier {
  int _bottomStatus = 0;

  int get bottomStatus => _bottomStatus;

  setBottomStatus(status)
  {
    _bottomStatus =  status;
    notifyListeners();
  }
}
