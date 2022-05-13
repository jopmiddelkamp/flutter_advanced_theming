import 'package:flutter/material.dart';

import '../../../src.dart';

class PillTheme extends ThemeExtension<PillTheme> {
  factory PillTheme({
    required CustomColorScheme colorScheme,
    required CustomTextTheme textTheme,
    MaterialStateProperty<TextStyle>? textStyle,
    MaterialStateProperty<Color>? backgroundColor,
    MaterialStateProperty<Color>? foregroundColor,
    MaterialStateProperty<EdgeInsetsGeometry>? padding,
    MaterialStateProperty<BorderSide>? side,
  }) {
    return PillTheme._(
      textStyle: textStyle ?? MaterialStateProperty.all(textTheme.bodyText),
      backgroundColor: backgroundColor ??
          ActiveMaterialStateProperty(
            active: colorScheme.primary,
            disabled: colorScheme.onSurface.withOpacity(0.12),
          ),
      foregroundColor: foregroundColor ??
          ActiveMaterialStateProperty(
            active: colorScheme.onPrimary,
            disabled: colorScheme.onSurface.withOpacity(0.38),
          ),
      padding: padding ??
          MaterialStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          )),
      side: side ?? MaterialStateProperty.all(BorderSide.none),
    );
  }

  const PillTheme._({
    required this.textStyle,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.padding,
    required this.side,
  });

  final MaterialStateProperty<TextStyle> textStyle;
  final MaterialStateProperty<Color> backgroundColor;
  final MaterialStateProperty<Color> foregroundColor;
  final MaterialStateProperty<EdgeInsetsGeometry> padding;
  final MaterialStateProperty<BorderSide> side;

  /// [ButtonStyle]
  @override
  ThemeExtension<PillTheme> lerp(
    ThemeExtension<PillTheme>? other,
    double t,
  ) {
    if (other is! PillTheme) {
      return this;
    }
    return PillTheme._(
      textStyle: lerpMaterialProperties(
          textStyle, other.textStyle, t, (a, b, t) => TextStyle.lerp(a, b, t)!),
      backgroundColor: lerpMaterialProperties<Color>(backgroundColor,
          other.backgroundColor, t, (a, b, t) => Color.lerp(a, b, t)!),
      foregroundColor: lerpMaterialProperties<Color>(foregroundColor,
          other.foregroundColor, t, (a, b, t) => Color.lerp(a, b, t)!),
      padding: lerpMaterialProperties<EdgeInsetsGeometry>(padding,
          other.padding, t, (a, b, t) => EdgeInsetsGeometry.lerp(a, b, t)!),
      side: lerpMaterialProperties<BorderSide>(
          side, other.side, t, (a, b, t) => BorderSide.lerp(a, b, t)),
    );
  }

  @override
  PillTheme copyWith({
    MaterialStateProperty<TextStyle>? textStyle,
    MaterialStateProperty<Color>? backgroundColor,
    MaterialStateProperty<Color>? foregroundColor,
    MaterialStateProperty<EdgeInsetsGeometry>? padding,
    MaterialStateProperty<BorderSide>? side,
  }) {
    return PillTheme._(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      padding: padding ?? this.padding,
      side: side ?? this.side,
    );
  }
}
