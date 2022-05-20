import 'package:flutter/material.dart';

import '../../../src.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  factory CustomTheme({
    required CustomColorScheme colorScheme,
    required CustomTextTheme textTheme,
    BadgeTheme? badgeTheme,
    BadgeTheme? badgeThemeOnPrimary,
    CustomAppBarTheme? customAppBarTheme,
    PillTheme? pillTheme,
  }) {
    return CustomTheme._(
      badgeTheme: badgeTheme ??
          BadgeTheme(
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
      badgeThemeOnPrimary: badgeThemeOnPrimary ??
          BadgeTheme.onPrimary(
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
      customAppBarTheme: customAppBarTheme ??
          CustomAppBarTheme(
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
      pillTheme: pillTheme ??
          PillTheme(
            colorScheme: colorScheme,
            textTheme: textTheme,
          ),
    );
  }

  CustomTheme._({
    required this.badgeTheme,
    required this.badgeThemeOnPrimary,
    required this.customAppBarTheme,
    required this.pillTheme,
  });

  final BadgeTheme? badgeTheme;
  final BadgeTheme? badgeThemeOnPrimary;
  final CustomAppBarTheme? customAppBarTheme;
  final PillTheme? pillTheme;

  @override
  CustomTheme copyWith({
    BadgeTheme? badgeTheme,
    BadgeTheme? badgeThemeOnPrimary,
    CustomAppBarTheme? customAppBarTheme,
    PillTheme? pillTheme,
  }) {
    return CustomTheme._(
      badgeTheme: badgeTheme ?? this.badgeTheme,
      badgeThemeOnPrimary: badgeThemeOnPrimary ?? this.badgeThemeOnPrimary,
      customAppBarTheme: customAppBarTheme ?? this.customAppBarTheme,
      pillTheme: pillTheme ?? this.pillTheme,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    if (other is! CustomTheme) {
      return this;
    }
    return CustomTheme._(
      badgeTheme: badgeTheme?.lerp(other.badgeTheme, t) as BadgeTheme,
      badgeThemeOnPrimary:
          badgeThemeOnPrimary?.lerp(other.badgeThemeOnPrimary, t) as BadgeTheme,
      customAppBarTheme: customAppBarTheme?.lerp(other.customAppBarTheme, t)
          as CustomAppBarTheme,
      pillTheme: pillTheme?.lerp(other.pillTheme, t) as PillTheme,
    );
  }

  static CustomTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomTheme>() as CustomTheme;
}
