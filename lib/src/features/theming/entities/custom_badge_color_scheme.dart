import 'package:flutter/material.dart';

class CustomBadgeColorScheme {
  const CustomBadgeColorScheme({
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final Color backgroundColor;
  final Color foregroundColor;

  static CustomBadgeColorScheme lerp(
    CustomBadgeColorScheme from,
    CustomBadgeColorScheme? to,
    double t,
  ) {
    if (to is! CustomBadgeColorScheme) {
      return from;
    }
    return CustomBadgeColorScheme(
      backgroundColor: Color.lerp(
        from.backgroundColor,
        to.backgroundColor,
        t,
      )!,
      foregroundColor: Color.lerp(
        from.foregroundColor,
        to.foregroundColor,
        t,
      )!,
    );
  }
}
