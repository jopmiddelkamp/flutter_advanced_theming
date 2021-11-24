import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBarThemeData extends Equatable with Diagnosticable {
  const CustomAppBarThemeData({
    required this.gradient,
    this.shape,
    this.foregroundColor,
    this.elevation,
    this.shadowColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.titleSpacing,
    this.titleTextStyle,
    this.systemOverlayStyle,
  });

  final Gradient gradient;
  final ShapeBorder? shape;
  final Color? foregroundColor;
  final double? elevation;
  final Color? shadowColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final double? titleSpacing;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;

  CustomAppBarThemeData copyWith({
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
    return CustomAppBarThemeData(
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

  CustomAppBarThemeData merge(
    CustomAppBarThemeData other,
  ) {
    return copyWith(
      gradient: other.gradient,
      shape: other.shape,
      foregroundColor: other.foregroundColor,
      elevation: other.elevation,
      shadowColor: other.shadowColor,
      iconTheme: other.iconTheme,
      actionsIconTheme: other.actionsIconTheme,
      titleSpacing: other.titleSpacing,
      titleTextStyle: other.titleTextStyle,
      systemOverlayStyle: other.systemOverlayStyle,
    );
  }

  CustomAppBarThemeData resolve(BuildContext context) => this;

  @override
  List<Object?> get props => [
        gradient,
        shape,
        foregroundColor,
        elevation,
        shadowColor,
        iconTheme,
        actionsIconTheme,
        titleSpacing,
        titleTextStyle,
        systemOverlayStyle,
      ];
}
