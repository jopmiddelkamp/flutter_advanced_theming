import 'dart:ui' show lerpDouble;

import 'package:flutter/material.dart';

import '../../src.dart';

class BadgeTheme extends ThemeExtension<BadgeTheme> {
  factory BadgeTheme({
    required CustomColorScheme colorScheme,
    required CustomTextTheme textTheme,
  }) {
    return BadgeTheme.custom(
      backgroundColor: colorScheme.primary,
      onBackgroundColor: colorScheme.onPrimary,
      size: textTheme.bodyText.fontSize!,
    );
  }
  factory BadgeTheme.onPrimary({
    required CustomColorScheme colorScheme,
    required CustomTextTheme textTheme,
  }) {
    return BadgeTheme.custom(
      backgroundColor: colorScheme.primary,
      onBackgroundColor: colorScheme.onPrimary,
      size: textTheme.bodyText.fontSize!,
    );
  }

  const BadgeTheme.custom({
    required this.backgroundColor,
    required this.onBackgroundColor,
    required this.size,
  });

  final Color backgroundColor;
  final Color onBackgroundColor;
  final double size;

  @override
  BadgeTheme copyWith({
    Color? backgroundColor,
    Color? onBackgroundColor,
    double? size,
  }) {
    return BadgeTheme.custom(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      onBackgroundColor: onBackgroundColor ?? this.onBackgroundColor,
      size: size ?? this.size,
    );
  }

  @override
  ThemeExtension<BadgeTheme> lerp(
    ThemeExtension<BadgeTheme>? other,
    double t,
  ) {
    if (other is! BadgeTheme) {
      return this;
    }
    return BadgeTheme.custom(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      onBackgroundColor:
          Color.lerp(onBackgroundColor, other.onBackgroundColor, t)!,
      size: lerpDouble(size, other.size, t)!,
    );
  }
}
