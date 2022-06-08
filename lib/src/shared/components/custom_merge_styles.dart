import 'package:flutter/material.dart';

class CustomMergeStyles extends StatelessWidget {
  const CustomMergeStyles({
    super.key,
    required this.textStyle,
    required this.iconTheme,
    required this.child,
  });
  const CustomMergeStyles.iconOnly({
    super.key,
    required this.iconTheme,
    required this.child,
  }) : textStyle = null;

  const CustomMergeStyles.textOnly({
    super.key,
    required this.textStyle,
    required this.child,
  }) : iconTheme = null;

  final TextStyle? textStyle;
  final IconThemeData? iconTheme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var child = this.child;
    if (textStyle != null) {
      child = DefaultTextStyle.merge(
        style: textStyle!,
        child: child,
      );
    }
    if (iconTheme != null) {
      child = IconTheme.merge(
        data: iconTheme!,
        child: child,
      );
    }
    return child;
  }
}
