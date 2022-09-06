import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../src.dart';

class CustomAppBarTheme extends ThemeExtension<CustomAppBarTheme> {
  factory CustomAppBarTheme({
    required CustomAppBarColorScheme primaryColorScheme,
    double? bottomLineHeight,
  }) {
    return CustomAppBarTheme._(
      primaryColorScheme: primaryColorScheme,
      bottomLineHeight: bottomLineHeight ?? 20,
    );
  }

  const CustomAppBarTheme._({
    required this.primaryColorScheme,
    required this.bottomLineHeight,
  });

  final CustomAppBarColorScheme primaryColorScheme;
  final double bottomLineHeight;

  @override
  CustomAppBarTheme copyWith({
    CustomAppBarColorScheme? primaryColorScheme,
    double? bottomLineHeight,
  }) {
    return CustomAppBarTheme._(
      primaryColorScheme: primaryColorScheme ?? this.primaryColorScheme,
      bottomLineHeight: bottomLineHeight ?? this.bottomLineHeight,
    );
  }

  @override
  ThemeExtension<CustomAppBarTheme> lerp(
    ThemeExtension<CustomAppBarTheme>? other,
    double t,
  ) {
    if (other is! CustomAppBarTheme) {
      return this;
    }
    return CustomAppBarTheme._(
      primaryColorScheme: CustomAppBarColorScheme.lerp(
        primaryColorScheme,
        other.primaryColorScheme,
        t,
      ),
      bottomLineHeight:
          lerpDouble(bottomLineHeight, other.bottomLineHeight, t)!,
    );
  }

  static CustomAppBarTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomAppBarTheme>() as CustomAppBarTheme;
}
