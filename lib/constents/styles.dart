import 'package:flutter/material.dart';

import 'Colors.dart';
import 'fonts.dart';

class FontCustomStyles {
  StyleGreenDS_69({double fontSizeParam}) {
    return TextStyle(
        color: greenColor,
        fontFamily: MyFonts.dsDigit,
        fontSize: fontSizeParam ?? 69);
  }
  static StyleCustomParams({double fontSize, Color fontColor}) {
    return TextStyle(
        color: fontColor,
        fontSize: fontSize,
        fontFamily: MyFonts.helveticaRegular);
  }
}
