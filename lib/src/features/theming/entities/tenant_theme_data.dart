import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../src.dart';
import 'tenant_text_theme_data.dart';

class TenantThemeData extends Equatable with Diagnosticable {
  factory TenantThemeData({
    ThemeData? materialTheme,
    TenantThemeColorScheme? colorScheme,
    CustomAppBarThemeData? appBarTheme,
    BadgeThemeData? badgeTheme,
    PillThemeData? pillTheme,
    TenantTextThemeData? textTheme,
  }) {
    colorScheme ??= TenantThemeColorScheme(
      primary: const Color.fromRGBO(0, 56, 95, 1),
      primaryDarker: const Color.fromRGBO(0, 44, 75, 1),
      primaryDarkest: const Color.fromRGBO(1, 13, 19, 1),
      onPrimary: const Color.fromRGBO(255, 255, 255, 1),
      secondary: const Color.fromRGBO(0, 191, 255, 1),
      onSecondary: const Color.fromRGBO(255, 255, 255, 1),
      background: const Color.fromRGBO(255, 255, 255, 1),
      backgroundDarker: const Color.fromRGBO(246, 246, 246, 1),
      onBackground: const Color.fromRGBO(55, 55, 55, 1),
      surface: const Color.fromRGBO(255, 255, 255, 1),
      onSurface: const Color.fromRGBO(55, 55, 55, 1),
      onSurfaceLighter: const Color.fromRGBO(182, 182, 182, 1),
      border: const Color.fromRGBO(235, 235, 235, 1),
      divider: const Color.fromRGBO(235, 235, 235, 1),
      error: const Color.fromRGBO(237, 109, 73, 1),
      onError: const Color.fromRGBO(255, 255, 255, 1),
      severe: const Color.fromRGBO(237, 109, 73, 1),
      onSevere: const Color.fromRGBO(255, 255, 255, 1),
      warning: const Color.fromRGBO(255, 194, 56, 1),
      onWarning: const Color.fromRGBO(255, 255, 255, 1),
      success: const Color.fromRGBO(93, 215, 132, 1),
      onSuccess: const Color.fromRGBO(255, 255, 255, 1),
      info: const Color.fromRGBO(182, 182, 182, 1),
      onInfo: const Color.fromRGBO(255, 255, 255, 1),
      badge: const Color.fromRGBO(237, 109, 73, 1),
      onBadge: const Color.fromRGBO(255, 255, 255, 1),
      brightness: Brightness.dark,
    );
    final theme = ThemeData.from(
      colorScheme: colorScheme.materialColorScheme,
    );
    textTheme ??= TenantTextThemeData(
      colorScheme: colorScheme,
    );

    materialTheme ??= theme.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: colorScheme.secondary,
        ),
      ),
      cardTheme: CardTheme(
        color: colorScheme.backgroundDarker,
      ),
    );
    appBarTheme ??= CustomAppBarThemeData(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: <Color>[
          colorScheme.primary,
          colorScheme.primaryDarkest,
        ],
      ),
      shape: const CustomAppBarShape(
        lineHeight: 20,
      ),
      titleTextStyle: textTheme.appBar,
    );
    badgeTheme ??= BadgeThemeData(
      backgroundColor: colorScheme.secondary,
      onBackgroundColor: colorScheme.onSecondary,
      size: 16.0,
    );
    pillTheme ??= const PillThemeData();

    return TenantThemeData._(
      materialTheme: materialTheme,
      colorScheme: colorScheme,
      appBarTheme: appBarTheme,
      badgeTheme: badgeTheme,
      pillTheme: pillTheme,
      textTheme: textTheme,
    );
  }

  TenantThemeData._({
    required this.materialTheme,
    required this.colorScheme,
    required this.appBarTheme,
    required this.badgeTheme,
    required this.pillTheme,
    required this.textTheme,
  });

  final ThemeData materialTheme;

  final TenantThemeColorScheme colorScheme;

  final CustomAppBarThemeData appBarTheme;

  final BadgeThemeData badgeTheme;

  final PillThemeData pillTheme;

  final TenantTextThemeData textTheme;

  TenantThemeData copyWith({
    ThemeData? materialTheme,
    TenantThemeColorScheme? colorScheme,
    CustomAppBarThemeData? appBarTheme,
    BadgeThemeData? badgeTheme,
    PillThemeData? pillTheme,
    TenantTextThemeData? textTheme,
  }) {
    return TenantThemeData(
      materialTheme: materialTheme ?? this.materialTheme,
      colorScheme: colorScheme ?? this.colorScheme,
      appBarTheme: appBarTheme ?? this.appBarTheme,
      badgeTheme: badgeTheme ?? this.badgeTheme,
      pillTheme: pillTheme ?? this.pillTheme,
      textTheme: textTheme ?? this.textTheme,
    );
  }

  TenantThemeData resolve(BuildContext context) => this;

  @override
  List<Object?> get props => [
        materialTheme,
        colorScheme,
        appBarTheme,
        badgeTheme,
        pillTheme,
        textTheme,
      ];
}
