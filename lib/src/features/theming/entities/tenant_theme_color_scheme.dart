import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TenantThemeColorScheme extends Equatable {
  TenantThemeColorScheme({
    required Color primary,
    required this.primaryDarker,
    required this.primaryDarkest,
    required Color secondary,
    required Color surface,
    required Color background,
    required this.backgroundDarker,
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

  TenantThemeColorScheme copyWith({
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
    return TenantThemeColorScheme(
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

  @override
  List<Object?> get props => [
        primary,
        primaryDarker,
        primaryDarkest,
        secondary,
        surface,
        background,
        backgroundDarker,
        error,
        onPrimary,
        onSecondary,
        onSurface,
        onBackground,
        onError,
        brightness,
        border,
        divider,
        severe,
        onSevere,
        warning,
        onWarning,
        success,
        onSuccess,
        info,
        onInfo,
        badge,
        onBadge,
      ];
}
