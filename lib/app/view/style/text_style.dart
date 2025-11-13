import 'package:flutter/material.dart';

class TextStyles {

  static Color color = Color(0xFF242B36);
  static Color color1 = Color(0xFF3B4759);
  
  static TextStyle p1Reguler = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
  );
  static TextStyle p1Medium = p1Reguler.copyWith(fontWeight: FontWeight.w500,);
  static TextStyle p1SemiBold = p1Reguler.copyWith(fontWeight: FontWeight.w600,);

  static TextStyle p2Reguler = p1Reguler.copyWith(fontSize: 18);
  static TextStyle p2Medium = p2Reguler.copyWith(fontWeight: FontWeight.w500,);
  static TextStyle p2SemiBold = p2Reguler.copyWith(fontWeight: FontWeight.w600,);

  static TextStyle p3Reguler = p1Reguler.copyWith(fontSize: 20);
  static TextStyle p3Medium = p3Reguler.copyWith(fontWeight: FontWeight.w500,);
  static TextStyle p3SemiBold = p3Reguler.copyWith(fontWeight: FontWeight.w600,);

  static TextStyle regular14 = p1Reguler.copyWith(fontSize: 14);
  static TextStyle regular12 = p1Reguler.copyWith(fontSize: 12,color: color1);
  static TextStyle regular10 = regular12.copyWith(fontSize: 10);
}