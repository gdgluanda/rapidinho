import 'package:flutter/material.dart';

class RapidinhoTextStyle {
  static final String RapidinhoFontFamily = 'Rajdhani';
  static final bottomTextStyle = TextStyle(fontFamily: RapidinhoFontFamily,color: Colors.red);
  static final displayText = TextStyle(fontFamily: RapidinhoFontFamily, fontSize: 25.0, color: Colors.black);
  static final smallText = TextStyle(fontFamily: RapidinhoFontFamily, fontSize: 13.0);
  static final verySmallText = TextStyle(fontFamily: RapidinhoFontFamily, fontSize: 10.0);
  static final mediumText = TextStyle(fontFamily: RapidinhoFontFamily, fontSize: 17.0);
  static final largeText = TextStyle(fontFamily: RapidinhoFontFamily, fontSize: 20.0);
  static final normalText = TextStyle(fontFamily: RapidinhoFontFamily);
  static final filterCategoryText = smallText.copyWith(color: Colors.white, fontWeight: FontWeight.w600);
}