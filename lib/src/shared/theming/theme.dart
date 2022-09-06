import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../src.dart';

ThemeData buildTheme(
  int tenantId,
) {
  final colorScheme = _getColorScheme(
    tenantId,
    Brightness.light,
  );
  return _buildTheme(colorScheme);
}

ThemeData buildDarkTheme(
  int tenantId,
) {
  final colorScheme = _getColorScheme(
    tenantId,
    Brightness.dark,
  );
  return _buildTheme(colorScheme);
}

ThemeData _buildTheme(
  CustomColorScheme colorScheme,
) {
  final theme = ThemeData.from(
    colorScheme: colorScheme.materialColorScheme,
    textTheme: const TextTheme(
      bodyMedium: CustomTextStyles.bodyText,
      bodyLarge: CustomTextStyles.bodyTextLarge,
    ),
  );

  return theme.copyWith(
    appBarTheme: AppBarTheme(
      foregroundColor: colorScheme.onPrimary,
      elevation: 4.0,
      titleSpacing: 4.0,
      titleTextStyle: CustomTextStyles.pageTitle,
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
    extensions: [
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
    ],
  );
}

CustomColorScheme _getColorScheme(
  int tenantId,
  Brightness brightness,
) {
  if (tenantId == 1) {
    if (brightness == Brightness.light) {
      return tenantOneLightColorScheme;
    } else {
      return tenantOneDarkColorScheme;
    }
  } else if (tenantId == 2) {
    if (brightness == Brightness.light) {
      return tenantTwoLightColorScheme;
    } else {
      return tenantTwoDarkColorScheme;
    }
  }
  throw Exception('Invalid tenantId and brightness combination');
}
