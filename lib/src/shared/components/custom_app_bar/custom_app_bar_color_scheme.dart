import 'package:flutter/material.dart';

class CustomAppBarColorScheme {
  const CustomAppBarColorScheme({
    required this.backgroundGradientStartColor,
    required this.backgroundGradientEndColor,
  });

  final Color backgroundGradientStartColor;
  final Color backgroundGradientEndColor;

  static CustomAppBarColorScheme lerp(
    CustomAppBarColorScheme from,
    CustomAppBarColorScheme? to,
    double t,
  ) {
    if (to is! CustomAppBarColorScheme) {
      return from;
    }
    return CustomAppBarColorScheme(
      backgroundGradientStartColor: Color.lerp(
        from.backgroundGradientStartColor,
        to.backgroundGradientStartColor,
        t,
      )!,
      backgroundGradientEndColor: Color.lerp(
        from.backgroundGradientEndColor,
        to.backgroundGradientEndColor,
        t,
      )!,
    );
  }
}
