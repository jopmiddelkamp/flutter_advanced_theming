import 'package:flutter/material.dart';

import '../theming.dart';

class CustomTextTheme extends ThemeExtension<CustomTextTheme> {
  factory CustomTextTheme({
    CustomColorScheme? colorScheme,
    TextStyle? bodyText,
    TextStyle? pageTitleLight,
  }) {
    colorScheme ??= CustomColorScheme();
    return CustomTextTheme._(
      bodyText: bodyText ??
          const TextStyle(
            fontFamily: "Recoleta",
            fontSize: 16.00,
            fontWeight: FontWeight.w400,
          ),
      pageTitleLight: pageTitleLight ??
          TextStyle(
            fontFamily: "Recoleta",
            fontStyle: FontStyle.normal,
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: colorScheme.onPrimary,
          ),
    );
  }

  CustomTextTheme._({
    required this.bodyText,
    required this.pageTitleLight,
  }) : materialTextTheme = TextTheme(
          bodyText2: bodyText,
        );

  final TextTheme materialTextTheme;

  final TextStyle bodyText;
  final TextStyle pageTitleLight;

  @override
  CustomTextTheme copyWith({
    TextStyle? bodyText,
    TextStyle? pageTitleLight,
  }) {
    return CustomTextTheme._(
      bodyText: bodyText ?? this.bodyText,
      pageTitleLight: pageTitleLight ?? this.pageTitleLight,
    );
  }

  @override
  ThemeExtension<CustomTextTheme> lerp(
    ThemeExtension<CustomTextTheme>? other,
    double t,
  ) {
    if (other is! CustomTextTheme) {
      return this;
    }
    return CustomTextTheme(
      pageTitleLight: TextStyle.lerp(pageTitleLight, other.pageTitleLight, t),
    );
  }

  static CustomTextTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomTextTheme>() ?? CustomTextTheme();
}
