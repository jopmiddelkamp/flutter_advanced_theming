import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../src.dart';

class CustomAppBarTheme extends ThemeExtension<CustomAppBarTheme> {
  factory CustomAppBarTheme({
    required CustomAppBarColorScheme primaryColorScheme,
    Gradient? gradient,
    ShapeBorder? shape,
    double? elevation,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
    double? bottomLineHeight,
  }) {
    const defaultElevation = 4.0;
    const defaultIconTheme = IconThemeData();
    const defaultActionsIconTheme = IconThemeData();
    const defaultTitleSpacing = 4.0;
    const defaultTitleTextStyle = CustomTextStyles.pageTitleLight;
    const defaultSystemOverlayStyle = SystemUiOverlayStyle.light;

    return CustomAppBarTheme._(
      primaryColorScheme: primaryColorScheme,
      elevation: elevation ?? defaultElevation,
      iconTheme: iconTheme ?? defaultIconTheme,
      actionsIconTheme: actionsIconTheme ?? defaultActionsIconTheme,
      titleSpacing: titleSpacing ?? defaultTitleSpacing,
      titleTextStyle: titleTextStyle ?? defaultTitleTextStyle,
      systemOverlayStyle: systemOverlayStyle ?? defaultSystemOverlayStyle,
      bottomLineHeight: bottomLineHeight ?? 20,
    );
  }

  const CustomAppBarTheme._({
    required this.primaryColorScheme,
    required this.elevation,
    required this.iconTheme,
    required this.actionsIconTheme,
    required this.titleSpacing,
    required this.titleTextStyle,
    required this.systemOverlayStyle,
    required this.bottomLineHeight,
  });

  final CustomAppBarColorScheme primaryColorScheme;
  final double elevation;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final double titleSpacing;
  final TextStyle titleTextStyle;
  final SystemUiOverlayStyle systemOverlayStyle;
  final double bottomLineHeight;

  @override
  CustomAppBarTheme copyWith({
    CustomAppBarColorScheme? primaryColorScheme,
    double? elevation,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
    double? bottomLineHeight,
  }) {
    return CustomAppBarTheme._(
      primaryColorScheme: primaryColorScheme ?? this.primaryColorScheme,
      elevation: elevation ?? this.elevation,
      iconTheme: iconTheme ?? this.iconTheme,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      systemOverlayStyle: systemOverlayStyle ?? this.systemOverlayStyle,
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
      elevation: lerpDouble(elevation, other.elevation, t)!,
      iconTheme: IconThemeData.lerp(iconTheme, other.iconTheme, t),
      actionsIconTheme:
          IconThemeData.lerp(actionsIconTheme, other.actionsIconTheme, t),
      titleSpacing: lerpDouble(titleSpacing, other.titleSpacing, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      systemOverlayStyle:
          t < 0.5 ? systemOverlayStyle : other.systemOverlayStyle,
      bottomLineHeight:
          lerpDouble(bottomLineHeight, other.bottomLineHeight, t)!,
    );
  }

  static CustomAppBarTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomAppBarTheme>() as CustomAppBarTheme;
}
