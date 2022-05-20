import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../src.dart';

class CustomAppBarTheme extends ThemeExtension<CustomAppBarTheme> {
  factory CustomAppBarTheme({
    required CustomColorScheme colorScheme,
    required CustomTextTheme textTheme,
    Gradient? gradient,
    Color? foregroundColor,
    ShapeBorder? shape,
    double? elevation,
    Color? shadowColor,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) {
    final defaultGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: <Color>[
        colorScheme.primary,
        colorScheme.primaryDarker,
      ],
    );
    final defaultForegroundColor = colorScheme.onPrimary;
    const defaultShape = CustomAppBarShape(
      lineHeight: 20,
    );
    const defaultElevation = 4.0;
    final defaultShadowColor = colorScheme.shadow;
    final defaultIconTheme = IconThemeData(
      color: colorScheme.onPrimary,
    );
    final defaultActionsIconTheme = IconThemeData(
      color: colorScheme.onPrimary,
    );
    final defaultTitleSpacing = textTheme.bodyText.fontSize! * 0.5;
    final defaultTitleTextStyle = textTheme.pageTitleLight.copyWith(
      color: colorScheme.onPrimary,
    );
    const defaultSystemOverlayStyle = SystemUiOverlayStyle.light;

    return CustomAppBarTheme._(
      gradient: gradient ?? defaultGradient,
      foregroundColor: foregroundColor ?? defaultForegroundColor,
      shape: shape ?? defaultShape,
      elevation: elevation ?? defaultElevation,
      shadowColor: shadowColor ?? defaultShadowColor,
      iconTheme: iconTheme ?? defaultIconTheme,
      actionsIconTheme: actionsIconTheme ?? defaultActionsIconTheme,
      titleSpacing: titleSpacing ?? defaultTitleSpacing,
      titleTextStyle: titleTextStyle ?? defaultTitleTextStyle,
      systemOverlayStyle: systemOverlayStyle ?? defaultSystemOverlayStyle,
    );
  }

  const CustomAppBarTheme._({
    required this.gradient,
    required this.foregroundColor,
    required this.shape,
    required this.elevation,
    required this.shadowColor,
    required this.iconTheme,
    required this.actionsIconTheme,
    required this.titleSpacing,
    required this.titleTextStyle,
    required this.systemOverlayStyle,
  });

  final Gradient gradient;
  final Color foregroundColor;
  final ShapeBorder shape;
  final double elevation;
  final Color shadowColor;
  final IconThemeData iconTheme;
  final IconThemeData actionsIconTheme;
  final double titleSpacing;
  final TextStyle titleTextStyle;
  final SystemUiOverlayStyle systemOverlayStyle;

  @override
  CustomAppBarTheme copyWith({
    Gradient? gradient,
    ShapeBorder? shape,
    Color? foregroundColor,
    double? elevation,
    Color? shadowColor,
    IconThemeData? iconTheme,
    IconThemeData? actionsIconTheme,
    double? titleSpacing,
    TextStyle? titleTextStyle,
    SystemUiOverlayStyle? systemOverlayStyle,
  }) {
    return CustomAppBarTheme._(
      gradient: gradient ?? this.gradient,
      shape: shape ?? this.shape,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      elevation: elevation ?? this.elevation,
      shadowColor: shadowColor ?? this.shadowColor,
      iconTheme: iconTheme ?? this.iconTheme,
      actionsIconTheme: actionsIconTheme ?? this.actionsIconTheme,
      titleSpacing: titleSpacing ?? this.titleSpacing,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      systemOverlayStyle: systemOverlayStyle ?? this.systemOverlayStyle,
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
      gradient: Gradient.lerp(gradient, other.gradient, t)!,
      foregroundColor: Color.lerp(foregroundColor, other.foregroundColor, t)!,
      shape: shapeBorderLerp(shape, other.shape, t),
      elevation: lerpDouble(elevation, other.elevation, t)!,
      shadowColor: Color.lerp(shadowColor, other.shadowColor, t)!,
      iconTheme: IconThemeData.lerp(iconTheme, other.iconTheme, t),
      actionsIconTheme:
          IconThemeData.lerp(actionsIconTheme, other.actionsIconTheme, t),
      titleSpacing: lerpDouble(titleSpacing, other.titleSpacing, t)!,
      titleTextStyle: TextStyle.lerp(titleTextStyle, other.titleTextStyle, t)!,
      systemOverlayStyle:
          t < 0.5 ? systemOverlayStyle : other.systemOverlayStyle,
    );
  }
}
