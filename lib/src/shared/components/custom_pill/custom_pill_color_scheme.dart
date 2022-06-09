import 'package:flutter/material.dart';

import '../../../src.dart';

class CustomPillColorScheme {
  const CustomPillColorScheme({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final MaterialStateProperty<Color> backgroundColor;
  final MaterialStateProperty<Color> foregroundColor;

  static CustomPillColorScheme lerp(
    CustomPillColorScheme from,
    CustomPillColorScheme? to,
    double t,
  ) {
    if (to is! CustomPillColorScheme) {
      return from;
    }
    return CustomPillColorScheme(
      backgroundColor: lerpMaterialProperties<Color>(from.backgroundColor,
          to.backgroundColor, t, (a, b, t) => Color.lerp(a, b, t)!),
      foregroundColor: lerpMaterialProperties<Color>(from.foregroundColor,
          to.foregroundColor, t, (a, b, t) => Color.lerp(a, b, t)!),
    );
  }
}
