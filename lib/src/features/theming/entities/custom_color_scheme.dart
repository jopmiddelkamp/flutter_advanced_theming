import 'package:flutter/material.dart';

class CustomColorScheme extends ThemeExtension<CustomColorScheme> {
  factory CustomColorScheme({
    Color? primary,
    Color? primaryDarker,
    Color? primaryDarkest,
    Color? secondary,
    Color? surface,
    Color? background,
    Color? backgroundDarker,
    Color? shadow,
    Color? error,
    Color? onPrimary,
    Color? onSecondary,
    Color? onSurface,
    Color? onSurfaceLighter,
    Color? onBackground,
    Color? onError,
    Brightness? brightness,
    Color? border,
    Color? divider,
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
  }) {
    return CustomColorScheme._(
      primary: primary ?? const Color.fromRGBO(0, 56, 95, 1),
      primaryDarker: primaryDarker ?? const Color.fromRGBO(0, 44, 75, 1),
      primaryDarkest: primaryDarkest ?? const Color.fromRGBO(1, 13, 19, 1),
      onPrimary: onPrimary ?? const Color.fromRGBO(255, 255, 255, 1),
      secondary: secondary ?? const Color.fromRGBO(0, 191, 255, 1),
      onSecondary: onSecondary ?? const Color.fromRGBO(255, 255, 255, 1),
      background: background ?? const Color.fromRGBO(255, 255, 255, 1),
      backgroundDarker:
          backgroundDarker ?? const Color.fromRGBO(246, 246, 246, 1),
      onBackground: onBackground ?? const Color.fromRGBO(55, 55, 55, 1),
      surface: surface ?? const Color.fromRGBO(255, 255, 255, 1),
      onSurface: onSurface ?? const Color.fromRGBO(55, 55, 55, 1),
      onSurfaceLighter:
          onSurfaceLighter ?? const Color.fromRGBO(182, 182, 182, 1),
      border: border ?? const Color.fromRGBO(235, 235, 235, 1),
      divider: divider ?? const Color.fromRGBO(235, 235, 235, 1),
      shadow: shadow ?? const Color.fromRGBO(45, 45, 45, 1),
      error: error ?? const Color.fromRGBO(237, 109, 73, 1),
      onError: onError ?? const Color.fromRGBO(255, 255, 255, 1),
      severe: severe ?? const Color.fromRGBO(237, 109, 73, 1),
      onSevere: onSevere ?? const Color.fromRGBO(255, 255, 255, 1),
      warning: warning ?? const Color.fromRGBO(255, 194, 56, 1),
      onWarning: onWarning ?? const Color.fromRGBO(255, 255, 255, 1),
      success: success ?? const Color.fromRGBO(93, 215, 132, 1),
      onSuccess: onSuccess ?? const Color.fromRGBO(255, 255, 255, 1),
      info: info ?? const Color.fromRGBO(182, 182, 182, 1),
      onInfo: onInfo ?? const Color.fromRGBO(255, 255, 255, 1),
      badge: badge ?? const Color.fromRGBO(237, 109, 73, 1),
      onBadge: onBadge ?? const Color.fromRGBO(255, 255, 255, 1),
      brightness: brightness ?? Brightness.dark,
    );
  }

  CustomColorScheme._({
    required Color primary,
    required this.primaryDarker,
    required this.primaryDarkest,
    required Color secondary,
    required Color surface,
    required Color background,
    required this.backgroundDarker,
    required Color shadow,
    required Color error,
    required Color onPrimary,
    required Color onSecondary,
    required Color onSurface,
    required this.onSurfaceLighter,
    required Color onBackground,
    required Color onError,
    required Brightness brightness,
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
  }) : materialColorScheme = ColorScheme(
          primary: primary,
          secondary: secondary,
          surface: surface,
          background: background,
          shadow: shadow,
          error: error,
          onPrimary: onPrimary,
          onSecondary: onSecondary,
          onSurface: onSurface,
          onBackground: onBackground,
          onError: onError,
          brightness: brightness,
        );

  final ColorScheme materialColorScheme;

  Brightness get brightness => materialColorScheme.brightness;
  Color get primary => materialColorScheme.primary;
  Color get secondary => materialColorScheme.secondary;
  Color get surface => materialColorScheme.surface;
  Color get background => materialColorScheme.background;
  Color get shadow => materialColorScheme.shadow;
  Color get error => materialColorScheme.error;
  Color get onPrimary => materialColorScheme.onPrimary;
  Color get onSecondary => materialColorScheme.onSecondary;
  Color get onSurface => materialColorScheme.onSurface;
  Color get onBackground => materialColorScheme.onBackground;
  Color get onError => materialColorScheme.onError;

  final Color primaryDarker;
  final Color primaryDarkest;

  final Color backgroundDarker;

  final Color onSurfaceLighter;

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
    Color? backgroundDarker,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? onSurfaceLighter,
    Color? border,
    Color? divider,
    Color? shadow,
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
      backgroundDarker: backgroundDarker ?? this.backgroundDarker,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      onSurfaceLighter: onSurfaceLighter ?? this.onSurfaceLighter,
      border: border ?? this.border,
      divider: divider ?? this.divider,
      shadow: shadow ?? this.shadow,
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
      backgroundDarker:
          Color.lerp(backgroundDarker, other.backgroundDarker, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      onSurfaceLighter:
          Color.lerp(onSurfaceLighter, other.onSurfaceLighter, t)!,
      border: Color.lerp(border, other.border, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
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

  static CustomColorScheme of(BuildContext context) =>
      Theme.of(context).extension<CustomColorScheme>() ?? CustomColorScheme();
}
