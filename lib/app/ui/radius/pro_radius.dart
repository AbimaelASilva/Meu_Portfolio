import 'package:flutter/material.dart';

abstract class ProRadius {
  static const proRadiusZero = BorderRadius.all(Radius.circular(0));
  static const proRadiusAll6 = BorderRadius.all(Radius.circular(6));
  static const proRadiusAll8 = BorderRadius.all(Radius.circular(8));
  static const proRadiusAll10 = BorderRadius.all(Radius.circular(10));
  static const proRadiusAll12 = BorderRadius.all(Radius.circular(12));
  static const proRadiusAll16 = BorderRadius.all(Radius.circular(16));
  static const proRadiusAll20 = BorderRadius.all(Radius.circular(20));
  static const proRadiusAll30 = BorderRadius.all(Radius.circular(30));
  static const proRadiusAll50 = BorderRadius.all(Radius.circular(50));
  static const proRadiusAll100 = BorderRadius.all(Radius.circular(100));

  //

  static const proRadiusTopAll8 = BorderRadius.only(
      topLeft: Radius.circular(8), topRight: Radius.circular(8));
  static const proRadiusBottonAll8 = BorderRadius.only(
      bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8));
  //
  static const proRadiusTopAll16 = BorderRadius.only(
      topLeft: Radius.circular(16), topRight: Radius.circular(16));
  static const proRadiusBottonAll16 = BorderRadius.only(
      bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16));
}
