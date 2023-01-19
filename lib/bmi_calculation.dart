import 'dart:math';
import 'package:flutter/material.dart';

class bmiCalc {
  bmiCalc({this.weight, this.height});

  final int weight;
  final int height;
  Color fcl;
  double _BMI;

  String GetBMI() {
    _BMI = weight / pow(height / 100, 2);
    return _BMI.toStringAsFixed(1);
  }

  String GetStringResult() {
    if (_BMI > 30) {
      fcl = Color(0xF4FF0000);
      return 'Obese';
    } else if (_BMI >= 25 && _BMI < 30) {
      fcl = Color(0xF4EE2020);
      return 'Overwieght';
    } else if (_BMI > 18.5) {
      fcl = Color(0xFF24D876);
      return 'Good';
    } else {
      fcl = Color(0xF4EE2020);
      return 'Underweight';
    }
  }

  String GetInterpret() {
    if (_BMI >= 30) {
      return 'Your body weight is way higher than a normal person. You should visit a dietician and work out alot.';
    } else if (_BMI >= 25 && _BMI < 30) {
      return 'Your body weight is higher than a normal person. You should eat less and excercise more.';
    } else if (_BMI > 18.5) {
      return 'Your BMI is absolutely perfect. Great Job!';
    } else {
      return 'Your body weight is lower than a normal person. You should eat more, preferably vegetables and grains';
    }
  }

  Color getFcl() {
    return fcl;
  }
}
