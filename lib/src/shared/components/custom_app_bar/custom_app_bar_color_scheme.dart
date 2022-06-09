import 'package:flutter/material.dart';

class CustomAppBarColorScheme {
  const CustomAppBarColorScheme({
    required this.backgroundGradientStartColor,
    required this.backgroundGradientEndColor,
    required this.foregroundColor,
    required this.shadowColor,
  });

  final Color backgroundGradientStartColor;
  final Color backgroundGradientEndColor;
  final Color foregroundColor;
  final Color shadowColor;

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
      foregroundColor: Color.lerp(
        from.foregroundColor,
        to.foregroundColor,
        t,
      )!,
      shadowColor: Color.lerp(
        from.shadowColor,
        to.shadowColor,
        t,
      )!,
    );
  }
}
