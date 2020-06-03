import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculatorBrain {
  final int weight;
  final int height;
  double _bmi;
  String _resultString;
  String _resultSummary;
  CalculatorBrain({@required this.weight, @required this.height});

  String calculatrBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultString() {
    if (_bmi >= 25.0) {
      _resultString = "OVER WEIGHT";
    } else if (_bmi > 18.5) {
      _resultString = "NORMAL";
    } else {
      _resultString = "Under WEIGHT";
    }

    return _resultString;
  }

  String getResultSummary() {
    if (_bmi >= 25) {
      _resultSummary =
          "You have a higher than normal body weight , try to excercise more ";
    } else if (_bmi > 18.5) {
      _resultSummary = "You have a normal body  weight ,good job! ";
    } else {
      _resultSummary =
          "You have a lower than normal body weight , try to eat more ";
    }
    return _resultSummary;
  }
}
