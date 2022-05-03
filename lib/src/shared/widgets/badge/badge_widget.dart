import 'package:flutter/material.dart';

import '../../../src.dart';

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.count,
    this.background,
    this.onBackground,
    this.size,
  }) : super(key: key);

  final Widget child;
  final int count;
  final Color? background;
  final Color? onBackground;
  final double? size;

  @override
  Widget build(
    BuildContext context,
  ) {
    final tenantTheme = TenantTheme.of(context);
    final theme = BadgeTheme.of(context);
    final size = _calculateSize(
      theme,
      tenantTheme,
    );
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            top: (size / 4.0) * -1.0,
            right: (size / 4.0) * -1.0,
            child: _buildBadge(
              tenantTheme: tenantTheme,
              theme: theme,
              size: size,
            ),
          ),
      ],
    );
  }

  // If size is not set this should be calculated based on render object. But
  // this is out of scope for our theming example.
  double _calculateSize(
    BadgeThemeData theme,
    TenantThemeData tenantTheme,
  ) {
    var size = this.size ?? theme.size;
    if (size != null) {
      return size;
    }
    var fontSize = tenantTheme.materialTheme.textTheme.bodyText2?.fontSize;
    if (fontSize != null) {
      return fontSize;
    }
    return 14;
  }

  Widget _buildBadge({
    required TenantThemeData tenantTheme,
    required BadgeThemeData theme,
    required double size,
  }) {
    return CircleAvatar(
      maxRadius: size / 2,
      backgroundColor:
          background ?? theme.backgroundColor ?? tenantTheme.colorScheme.badge,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: Text(
            count < 10 ? '$count' : '9+',
            style: TextStyle(
              color: onBackground ??
                  theme.onBackgroundColor ??
                  tenantTheme.colorScheme.onBadge,
              fontSize: size / 4.0 * 2.5,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
