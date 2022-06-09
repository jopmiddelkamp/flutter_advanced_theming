import 'package:flutter/material.dart';

import '../../../src.dart';

class CustomPillTheme extends ThemeExtension<CustomPillTheme> {
  factory CustomPillTheme({
    required CustomPillColorScheme primaryColorScheme,
    MaterialStateProperty<TextStyle>? textStyle,
    MaterialStateProperty<EdgeInsetsGeometry>? padding,
    MaterialStateProperty<BorderSide>? side,
  }) {
    return CustomPillTheme._(
      primaryColorScheme: primaryColorScheme,
      textStyle:
          textStyle ?? MaterialStateProperty.all(CustomTextStyles.bodyText),
      padding: padding ??
          MaterialStateProperty.all(const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          )),
      side: side ?? MaterialStateProperty.all(BorderSide.none),
    );
  }

  const CustomPillTheme._({
    required this.primaryColorScheme,
    required this.textStyle,
    required this.padding,
    required this.side,
  });

  final CustomPillColorScheme primaryColorScheme;

  final MaterialStateProperty<TextStyle> textStyle;
  final MaterialStateProperty<EdgeInsetsGeometry> padding;
  final MaterialStateProperty<BorderSide> side;

  /// [ButtonStyle]
  @override
  ThemeExtension<CustomPillTheme> lerp(
    ThemeExtension<CustomPillTheme>? other,
    double t,
  ) {
    if (other is! CustomPillTheme) {
      return this;
    }
    return CustomPillTheme._(
      primaryColorScheme: CustomPillColorScheme.lerp(
        primaryColorScheme,
        other.primaryColorScheme,
        t,
      ),
      textStyle: lerpMaterialProperties(
        textStyle,
        other.textStyle,
        t,
        (a, b, t) => TextStyle.lerp(a, b, t)!,
      ),
      padding: lerpMaterialProperties<EdgeInsetsGeometry>(
        padding,
        other.padding,
        t,
        (a, b, t) => EdgeInsetsGeometry.lerp(a, b, t)!,
      ),
      side: lerpMaterialProperties<BorderSide>(
        side,
        other.side,
        t,
        (a, b, t) => BorderSide.lerp(a, b, t),
      ),
    );
  }

  @override
  CustomPillTheme copyWith({
    CustomPillColorScheme? primaryColorScheme,
    MaterialStateProperty<TextStyle>? textStyle,
    MaterialStateProperty<EdgeInsetsGeometry>? padding,
    MaterialStateProperty<BorderSide>? side,
  }) {
    return CustomPillTheme._(
      primaryColorScheme: primaryColorScheme ?? this.primaryColorScheme,
      textStyle: textStyle ?? this.textStyle,
      padding: padding ?? this.padding,
      side: side ?? this.side,
    );
  }

  static CustomPillTheme of(BuildContext context) =>
      Theme.of(context).extension<CustomPillTheme>() as CustomPillTheme;
}
