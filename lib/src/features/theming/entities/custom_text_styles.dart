import 'package:flutter/material.dart';

const _defaultFontFamily = "Recoleta";

class CustomTextStyles {
  static const bodyText = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 16.00,
    fontWeight: FontWeight.w400,
  );
  static const badgeText = TextStyle(
    fontFamily: _defaultFontFamily,
    fontSize: 8.00,
    fontWeight: FontWeight.w400,
  );
  static const pageTitleLight = TextStyle(
    fontFamily: _defaultFontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
  );
}
