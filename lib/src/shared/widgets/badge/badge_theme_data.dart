import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class BadgeThemeData extends Equatable {
  const BadgeThemeData({
    this.backgroundColor,
    this.onBackgroundColor,
    this.size,
  });

  final Color? backgroundColor;
  final Color? onBackgroundColor;
  final double? size;

  BadgeThemeData merge(
    BadgeThemeData other,
  ) {
    return copyWith(
      backgroundColor: other.backgroundColor,
      onBackgroundColor: other.onBackgroundColor,
      size: other.size,
    );
  }

  BadgeThemeData copyWith({
    Color? backgroundColor,
    Color? onBackgroundColor,
    double? size,
  }) {
    return BadgeThemeData(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      onBackgroundColor: onBackgroundColor ?? this.onBackgroundColor,
      size: size ?? this.size,
    );
  }

  BadgeThemeData resolve(BuildContext context) => this;

  @override
  List<Object?> get props => [
        backgroundColor,
        onBackgroundColor,
        size,
      ];
}
