import 'package:flutter/material.dart';

import '../../src.dart';

class CustomMergeForegroundColor extends StatelessWidget {
  const CustomMergeForegroundColor({
    super.key,
    required this.color,
    required this.child,
  });

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomMergeStyles(
      iconTheme: IconThemeData(
        color: color,
      ),
      textStyle: TextStyle(
        color: color,
      ),
      child: child,
    );
  }
}
