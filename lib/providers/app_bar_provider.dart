
import 'package:flutter/material.dart';

class appBarProvider with ChangeNotifier {
  double _offset = 0.0 ;

  void setOfset(double x){
    _offset = x;
    notifyListeners();
  }

  get getOffSet {
    return _offset ;

  }

}

