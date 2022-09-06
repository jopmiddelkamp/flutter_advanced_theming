import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../src.dart';

const double kCustomToolbarHeight = 75.0;

enum CustomAppBarColorSchemes {
  primary,
}

const _defaultColorScheme = CustomAppBarColorSchemes.primary;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    this.colorScheme = _defaultColorScheme,
    this.backgroundGradientStartColor,
    this.backgroundGradientEndColor,
    this.foregroundColor,
    this.shadowColor,
    required this.title,
    this.toolbarHeight,
    this.elevation,
    this.iconTheme,
    this.actionsIconTheme,
    this.titleSpacing,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.actions,
    this.bottomLineHeight,
  }) : preferredSize = Size.fromHeight(toolbarHeight ?? kCustomToolbarHeight);

  @override
  final Size preferredSize;

  final CustomAppBarColorSchemes colorScheme;
  final Color? backgroundGradientStartColor;
  final Color? backgroundGradientEndColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final Widget title;
  final double? toolbarHeight;
  final double? elevation;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final double? titleSpacing;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final List<Widget>? actions;
  final double? bottomLineHeight;

  @override
  Widget build(BuildContext context) {
    final theme = AppBarTheme.of(context);
    final customTheme = CustomAppBarTheme.of(context);
    final colorScheme = _getColorScheme(customTheme);

    final shape = CustomAppBarShape(
      lineHeight: bottomLineHeight ?? customTheme.bottomLineHeight,
    );

    const defaultForegroundColor = Colors.white;

    return CustomMergeForegroundColor(
      color: foregroundColor ?? theme.foregroundColor ?? defaultForegroundColor,
      child: AppBar(
        toolbarHeight: toolbarHeight,
        title: title,
        flexibleSpace: Container(
          decoration: ShapeDecoration(
            shape: shape,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                backgroundGradientStartColor ??
                    colorScheme.backgroundGradientStartColor,
                backgroundGradientEndColor ??
                    colorScheme.backgroundGradientEndColor,
              ],
            ),
          ),
        ),
        shape: shape,
        foregroundColor:
            foregroundColor ?? theme.foregroundColor ?? defaultForegroundColor,
        elevation: elevation,
        iconTheme: iconTheme,
        actionsIconTheme: actionsIconTheme,
        titleSpacing: titleSpacing,
        titleTextStyle: titleTextStyle,
        systemOverlayStyle: systemOverlayStyle,
        actions: actions,
        backgroundColor: Colors.transparent,
      ),
    );
  }

  CustomAppBarColorScheme _getColorScheme(
    CustomAppBarTheme theme,
  ) {
    switch (colorScheme) {
      case CustomAppBarColorSchemes.primary:
        return theme.primaryColorScheme;
    }
  }
}

class CustomAppBarShape extends ContinuousRectangleBorder {
  const CustomAppBarShape({
    required this.lineHeight,
  });

  final double lineHeight;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double height = rect.height;
    double width = rect.width;
    var path = Path();
    path.lineTo(0, height);
    path.lineTo(width, height - lineHeight);
    path.lineTo(width, 0);
    path.close();

    return path;
  }
}
