import 'package:flutter/material.dart';

import '../../../src.dart';

class CustomBadgeTheme extends ThemeExtension<CustomBadgeTheme> {
  const CustomBadgeTheme({
    required this.primaryColorScheme,
    required this.onPrimaryColorScheme,
    this.textStyle = CustomTextStyles.badgeText,
    this.padding = const EdgeInsets.all(2),
  });

  final CustomBadgeColorScheme primaryColorScheme;
  final CustomBadgeColorScheme onPrimaryColorScheme;
  final TextStyle textStyle;
  final EdgeInsets padding;

  @override
  CustomBadgeTheme copyWith({
    CustomBadgeColorScheme? primaryColorScheme,
    CustomBadgeColorScheme? onPrimaryColorScheme,
    TextStyle? textStyle,
    EdgeInsets? padding,
  }) {
    return CustomBadgeTheme(
      primaryColorScheme: primaryColorScheme ?? this.primaryColorScheme,
      onPrimaryColorScheme: onPrimaryColorScheme ?? this.onPrimaryColorScheme,
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
    );
  }

  @override
  ThemeExtension<CustomBadgeTheme> lerp(
    ThemeExtension<CustomBadgeTheme>? other,
    double t,
  ) {
    if (other is! CustomBadgeTheme) {
      return this;
    }
    return CustomBadgeTheme(
      primaryColorScheme: CustomBadgeColorScheme.lerp(
        primaryColorScheme,
        other.primaryColorScheme,
        t,
      ),
      onPrimaryColorScheme: CustomBadgeColorScheme.lerp(
        onPrimaryColorScheme,
        other.onPrimaryColorScheme,
        t,
      ),
      textStyle: TextStyle.lerp(textStyle, other.textStyle, t)!,
      padding: EdgeInsets.lerp(padding, other.padding, t)!,
    );
  }

  static CustomBadgeTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomBadgeTheme>() as CustomBadgeTheme;
}
