import 'package:flutter/material.dart';

import '../../src.dart';

enum _BadgeStyleType {
  primary,
  onPrimary,
}

class Badge extends StatelessWidget {
  const Badge({
    super.key,
    required this.child,
    required this.count,
    this.background,
    this.onBackground,
    this.size,
  }) : _styleType = _BadgeStyleType.primary;

  const Badge.onPrimary({
    super.key,
    required this.child,
    required this.count,
    this.background,
    this.onBackground,
    this.size,
  }) : _styleType = _BadgeStyleType.onPrimary;

  final _BadgeStyleType _styleType;
  final Widget child;
  final int count;
  final Color? background;
  final Color? onBackground;
  final double? size;

  @override
  Widget build(
    BuildContext context,
  ) {
    final colorScheme = CustomColorScheme.of(context);
    final textTheme = CustomTextTheme.of(context);
    final theme = _getTheme(context, colorScheme, textTheme);

    final size = _getSize(theme, textTheme);
    final background = _getBackgroundColor(theme, colorScheme);
    final onBackground = _getOnBackgroundColor(theme, colorScheme);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            top: (size / 4.0) * -1.0,
            right: (size / 4.0) * -1.0,
            child: _Badge(
              count: count,
              background: background,
              onBackground: onBackground,
              size: size,
            ),
          ),
      ],
    );
  }

  Color _getOnBackgroundColor(
    BadgeTheme theme,
    CustomColorScheme colorScheme,
  ) {
    return onBackground ?? theme.onBackgroundColor;
  }

  double _getSize(
    BadgeTheme theme,
    CustomTextTheme textTheme,
  ) {
    return size ?? theme.size;
  }

  Color _getBackgroundColor(
    BadgeTheme theme,
    CustomColorScheme colorScheme,
  ) {
    return background ?? theme.backgroundColor;
  }

  BadgeTheme _getTheme(
    BuildContext context,
    CustomColorScheme colorScheme,
    CustomTextTheme textTheme,
  ) {
    final customTheme = CustomTheme.of(context);
    switch (_styleType) {
      case _BadgeStyleType.primary:
        return customTheme.badgeTheme ??
            BadgeTheme(
              colorScheme: colorScheme,
              textTheme: textTheme,
            );
      case _BadgeStyleType.onPrimary:
        return customTheme.badgeThemeOnPrimary ??
            BadgeTheme.onPrimary(
              colorScheme: colorScheme,
              textTheme: textTheme,
            );
    }
  }
}

class _Badge extends StatelessWidget {
  const _Badge({
    required this.count,
    required this.background,
    required this.onBackground,
    required this.size,
  });

  final int count;
  final Color background;
  final Color onBackground;
  final double size;

  @override
  Widget build(
    BuildContext context,
  ) {
    return CircleAvatar(
      maxRadius: size / 2,
      backgroundColor: background,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Text(
            count < 10 ? '$count' : '9+',
            style: TextStyle(
              color: onBackground,
              fontSize: size / 4.0 * 2.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
