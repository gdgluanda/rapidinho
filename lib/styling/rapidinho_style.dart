import 'package:flutter/material.dart';

class RapidinhoTextStyle {
  static final String rapidinhoFontFamily = 'Rajdhani';
  static final bottomTextStyle =
      TextStyle(fontFamily: rapidinhoFontFamily, color: Colors.red);
  static final displayText = TextStyle(
      fontFamily: rapidinhoFontFamily, fontSize: 25.0, color: Colors.black);
  static final smallText =
      TextStyle(fontFamily: rapidinhoFontFamily, fontSize: 13.0);
  static final verySmallText =
      TextStyle(fontFamily: rapidinhoFontFamily, fontSize: 10.0);
  static final mediumText =
      TextStyle(fontFamily: rapidinhoFontFamily, fontSize: 17.0);
  static final largeText =
      TextStyle(fontFamily: rapidinhoFontFamily, fontSize: 20.0);
  static final normalText = TextStyle(fontFamily: rapidinhoFontFamily);
  static final filterCategoryText =
      smallText.copyWith(color: Colors.white, fontWeight: FontWeight.w600);
}
