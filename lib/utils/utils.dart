import 'package:flutter/material.dart';
import 'package:milestone_2/resources/strings.dart';

extension MyElevatedStyle on ElevatedButton {
  static ButtonStyle blackButtonStyle() => ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(46),
        backgroundColor: Colors.black,
        foregroundColor: Colors.grey,
      );

  static ButtonStyle blackButtonNoActiveStyle() => ElevatedButton.styleFrom(
      minimumSize: const Size.fromHeight(46),
      backgroundColor: MyColors.grayF0F0F0,
      foregroundColor: Colors.black,
      elevation: 0
  );
}

extension MyTextStyle on TextStyle {
  static titleStyle([Color color = Colors.black, FontWeight weight = FontWeight.w500]) =>
      TextStyle(fontWeight: weight, fontFamily: 'Roboto', fontSize: 14, color: color);

  static semiBoldStyle([double textSize = 18]) =>
      TextStyle(fontWeight: FontWeight.w700, fontFamily: 'Roboto', fontSize: textSize);
}
