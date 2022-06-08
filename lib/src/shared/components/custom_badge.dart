import 'dart:ui';

import 'package:flutter/material.dart';

import '../../src.dart';

enum CustomBadgeColorSchemes {
  primary,
  onPrimary,
}

const _defaultColorScheme = CustomBadgeColorSchemes.primary;

class CustomBadge extends StatelessWidget {
  const CustomBadge({
    super.key,
    this.colorScheme = _defaultColorScheme,
    required this.child,
    required this.count,
    this.background,
    this.foregroundColor,
    this.textStyle,
    this.padding,
  });

  final CustomBadgeColorSchemes colorScheme;
  final Widget child;
  final int count;
  final Color? background;
  final Color? foregroundColor;
  final TextStyle? textStyle;
  final EdgeInsets? padding;

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = CustomBadgeTheme.of(context);
    final colorScheme = _getColorScheme(theme);

    final background = _getBackgroundColor(colorScheme);
    final onBackground = _getForegroundColor(colorScheme);

    final textStyle = this.textStyle ?? theme.textStyle;
    final padding = this.padding ?? theme.padding;
    final size = textStyle.fontSize! + padding.vertical;

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

  Color _getForegroundColor(
    CustomBadgeColorScheme colorScheme,
  ) {
    return foregroundColor ?? colorScheme.foregroundColor;
  }

  Color _getBackgroundColor(
    CustomBadgeColorScheme colorScheme,
  ) {
    return background ?? colorScheme.backgroundColor;
  }

  CustomBadgeColorScheme _getColorScheme(
    CustomBadgeTheme theme,
  ) {
    switch (colorScheme) {
      case CustomBadgeColorSchemes.primary:
        return theme.primaryColorScheme;
      case CustomBadgeColorSchemes.onPrimary:
        return theme.onPrimaryColorScheme;
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
