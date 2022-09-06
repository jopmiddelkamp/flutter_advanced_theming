import 'package:flutter/material.dart';

class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  const CustomColorScheme({
    required this.primary,
    required this.primaryDarker,
    required this.primaryDarkest,
    required this.secondary,
    required this.surface,
    required this.background,
    required this.error,
    required this.onPrimary,
    required this.onSecondary,
    required this.onSurface,
    required this.onBackground,
    required this.onError,
    required this.brightness,
    required this.border,
    required this.divider,
    required this.severe,
    required this.onSevere,
    required this.warning,
    required this.onWarning,
    required this.success,
    required this.onSuccess,
    required this.info,
    required this.onInfo,
    required this.badge,
    required this.onBadge,
  });

  ColorScheme get materialColorScheme {
    return ColorScheme(
      primary: primary,
      secondary: secondary,
      surface: surface,
      background: background,
      error: error,
      onPrimary: onPrimary,
      onSecondary: onSecondary,
      onSurface: onSurface,
      onBackground: onBackground,
      onError: onError,
      brightness: brightness,
    );
  }

  final Brightness brightness;
  final Color primary;
  final Color secondary;
  final Color surface;
  final Color background;
  final Color error;
  final Color onPrimary;
  final Color onSecondary;
  final Color onSurface;
  final Color onBackground;
  final Color onError;

  final Color primaryDarker;
  final Color primaryDarkest;

  final Color border;

  final Color divider;

  final Color severe;
  final Color onSevere;
  final Color warning;
  final Color onWarning;
  final Color success;
  final Color onSuccess;
  final Color info;
  final Color onInfo;

  final Color badge;
  final Color onBadge;

  @override
  CustomColorScheme copyWith({
    Color? primary,
    Color? primaryDarker,
    Color? primaryDarkest,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? border,
    Color? divider,
    Color? error,
    Color? onError,
    Color? severe,
    Color? onSevere,
    Color? warning,
    Color? onWarning,
    Color? success,
    Color? onSuccess,
    Color? info,
    Color? onInfo,
    Color? badge,
    Color? onBadge,
    Brightness? brightness,
  }) {
    return CustomColorScheme(
      primary: primary ?? this.primary,
      primaryDarker: primaryDarker ?? this.primaryDarker,
      primaryDarkest: primaryDarkest ?? this.primaryDarkest,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      severe: severe ?? this.severe,
      onSevere: onSevere ?? this.onSevere,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      badge: badge ?? this.badge,
      onBadge: onBadge ?? this.onBadge,
      brightness: brightness ?? this.brightness,
    );
  }

  // Controls how the properties change on theme changes
  @override
  CustomColorScheme lerp(ThemeExtension<CustomColorScheme>? other, double t) {
    if (other is! CustomColorScheme) {
      return this;
    }
    return CustomColorScheme(
      primary: Color.lerp(primary, other.primary, t)!,
      primaryDarker: Color.lerp(primaryDarker, other.primaryDarker, t)!,
      primaryDarkest: Color.lerp(primaryDarkest, other.primaryDarkest, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      severe: Color.lerp(severe, other.severe, t)!,
      onSevere: Color.lerp(onSevere, other.onSevere, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      badge: Color.lerp(badge, other.badge, t)!,
      onBadge: Color.lerp(onBadge, other.onBadge, t)!,
      brightness: other.brightness,
    );
  }

  static CustomColorScheme of(BuildContext context) {
    return Theme.of(context).extension<CustomColorScheme>()!;
  }
}
