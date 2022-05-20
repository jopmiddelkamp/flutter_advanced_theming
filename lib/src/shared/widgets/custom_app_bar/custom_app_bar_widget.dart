import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../src.dart';

const double kCustomToolbarHeight = 75.0;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    super.key,
    required this.title,
    this.toolbarHeight,
    this.gradient,
    this.shape,
    this.foregroundColor,
    this.elevation,
    this.shadowColor,
    this.iconTheme,
    this.actionsIconTheme,
    this.titleSpacing,
    this.titleTextStyle,
    this.systemOverlayStyle,
    this.actions,
  }) : preferredSize = Size.fromHeight(toolbarHeight ?? kCustomToolbarHeight);

  @override
  final Size preferredSize;

  final Widget title;
  final double? toolbarHeight;
  final Gradient? gradient;
  final ShapeBorder? shape;
  final Color? foregroundColor;
  final double? elevation;
  final Color? shadowColor;
  final IconThemeData? iconTheme;
  final IconThemeData? actionsIconTheme;
  final double? titleSpacing;
  final TextStyle? titleTextStyle;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = CustomColorScheme.of(context);
    final textTheme = CustomTextTheme.of(context);
    final theme = _getTheme(context, colorScheme, textTheme);

    final shape = this.shape ?? theme.shape;

    return AppBar(
      toolbarHeight: toolbarHeight,
      title: title,
      flexibleSpace: Container(
        decoration: ShapeDecoration(
          shape: shape,
          gradient: gradient ?? theme.gradient,
        ),
      ),
      shape: shape,
      foregroundColor: foregroundColor ?? theme.foregroundColor,
      elevation: elevation ?? theme.elevation,
      shadowColor: shadowColor ?? theme.shadowColor,
      iconTheme: iconTheme ?? theme.iconTheme,
      actionsIconTheme: actionsIconTheme ?? theme.actionsIconTheme,
      titleSpacing: titleSpacing ?? theme.titleSpacing,
      titleTextStyle: titleTextStyle ?? theme.titleTextStyle,
      systemOverlayStyle: systemOverlayStyle ?? theme.systemOverlayStyle,
      actions: actions,
      backgroundColor: Colors.transparent,
    );
  }

  CustomAppBarTheme _getTheme(
    BuildContext context,
    CustomColorScheme colorScheme,
    CustomTextTheme textTheme,
  ) {
    final customTheme = CustomTheme.of(context);
    return customTheme.customAppBarTheme ??
        CustomAppBarTheme(
          colorScheme: colorScheme,
          textTheme: textTheme,
        );
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
