import 'package:flutter/material.dart';

import '../../src.dart';

ThemeData buildTheme(
  CustomColorScheme colorScheme,
) {
  final theme = ThemeData.from(
    colorScheme: colorScheme.materialColorScheme,
  );

  return theme.copyWith(extensions: [
    colorScheme,
    CustomPillTheme(
      primaryColorScheme: CustomPillColorScheme(
        backgroundColor: SelectableMaterialStateProperty(
          active: colorScheme.primary,
          selected: colorScheme.primaryDarkest,
          disabled: colorScheme.primary.withOpacity(0.3),
        ),
        foregroundColor: SelectableMaterialStateProperty(
          active: colorScheme.onPrimary,
          selected: colorScheme.onPrimary,
          disabled: colorScheme.onPrimary,
        ),
      ),
    ),
    CustomAppBarTheme(
      primaryColorScheme: CustomAppBarColorScheme(
        backgroundGradientStartColor: colorScheme.primary,
        backgroundGradientEndColor: colorScheme.primaryDarker,
        foregroundColor: colorScheme.onPrimary,
        shadowColor: colorScheme.shadow,
      ),
    ),
    CustomBadgeTheme(
      primaryColorScheme: CustomBadgeColorScheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      onPrimaryColorScheme: CustomBadgeColorScheme(
        backgroundColor: colorScheme.primaryDarkest,
        foregroundColor: colorScheme.onPrimary,
      ),
    )
  ]);
}
