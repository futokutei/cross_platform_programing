import 'package:flutter/material.dart';


class DataProvider extends ChangeNotifier{
  double _leftUpAngle = 0.0;
  double _rightUpAngle = 0.0;
  double _leftDownAngle = 0.0;
  double _rightDownAngle = 0.0;

  double get leftUpAngle => _leftUpAngle;
  double get rightUpAngle => _rightUpAngle;
  double get leftDownAngle => _leftDownAngle;
  double get rightDownAngle => _rightDownAngle;

  set leftUpAngle(double value){
    _leftUpAngle = value;
    notifyListeners();
  }
  set rightUpAngle(double value){
    _rightUpAngle = value;
    notifyListeners();
  }
  set leftDownAngle(double value){
    _leftDownAngle = value;
    notifyListeners();
  }
  set rightDownAngle(double value){
    _rightDownAngle = value;
    notifyListeners();
  }
}