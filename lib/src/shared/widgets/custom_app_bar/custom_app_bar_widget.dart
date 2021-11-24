import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../src.dart';

const double kCustomToolbarHeight = 75.0;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
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
  })  : preferredSize = Size.fromHeight(toolbarHeight ?? kCustomToolbarHeight),
        super(key: key);

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
    final theme = CustomAppBarTheme.of(context);
    return AppBar(
      toolbarHeight: toolbarHeight,
      title: title,
      flexibleSpace: _buildFlexibleSpace(
        context,
        theme,
      ),
      shape: shape ?? theme.shape,
      foregroundColor: foregroundColor ?? foregroundColor,
      elevation: elevation ?? theme.elevation,
      shadowColor: shadowColor ?? theme.shadowColor,
      iconTheme: iconTheme ?? theme.iconTheme,
      actionsIconTheme: actionsIconTheme ?? theme.actionsIconTheme,
      titleSpacing: titleSpacing ?? theme.titleSpacing,
      titleTextStyle: titleTextStyle ?? theme.titleTextStyle,
      systemOverlayStyle: systemOverlayStyle ?? theme.systemOverlayStyle,
      actions: actions,
    );
  }

  Widget? _buildFlexibleSpace(
    BuildContext context,
    CustomAppBarThemeData theme,
  ) {
    final shape = this.shape ?? theme.shape;
    if (shape == null) {
      return null;
    }
    return Container(
      decoration: ShapeDecoration(
        shape: shape,
        gradient: gradient ?? theme.gradient,
      ),
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
