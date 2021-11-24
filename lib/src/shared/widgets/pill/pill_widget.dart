import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../src.dart';

class Pill extends StatefulWidget {
  const Pill({
    Key? key,
    required this.onPressed,
    this.style,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;

  final PillStyle? style;

  final Widget? child;

  PillStyle defaultStyleOf(
    BuildContext context,
  ) {
    final theme = TenantTheme.of(context);
    final colorScheme = theme.colorScheme;
    final textScaleFactor = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;

    return Pill.styleFrom(
      primary: colorScheme.primary,
      onPrimary: colorScheme.onPrimary,
      onSurface: colorScheme.onSurface,
      textStyle: theme.materialTheme.textTheme.button,
      padding: EdgeInsets.symmetric(
        horizontal: 12 * textScaleFactor,
        vertical: 6 * textScaleFactor,
      ),
      side: const BorderSide(
        style: BorderStyle.none,
      ),
      animationDuration: kThemeAnimationDuration,
    );
  }

  static Widget onDarkSurface({
    required VoidCallback onPressed,
    required Widget child,
  }) {
    return Builder(builder: (context) {
      final theme = Theme.of(context);
      return Pill(
        onPressed: onPressed,
        child: child,
        style: Pill.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.white,
          side: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
          textStyle: theme.textTheme.button!.copyWith(
            color: Colors.white,
          ),
        ),
      );
    });
  }

  static PillStyle styleFrom({
    Color? primary,
    Color? onPrimary,
    Color? onSurface,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    BorderSide? side,
    Duration? animationDuration,
  }) {
    final backgroundColor = (onSurface == null && primary == null)
        ? null
        : _PillDefaultBackground(primary, onSurface);
    final foregroundColor = (onSurface == null && onPrimary == null)
        ? null
        : _PillDefaultForeground(onPrimary, onSurface);

    return PillStyle(
      textStyle: MaterialStateProperty.all<TextStyle?>(textStyle),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      padding: _allOrNull(padding),
      side: _allOrNull(side),
      animationDuration: animationDuration,
    );
  }

  static MaterialStateProperty<T>? _allOrNull<T>(T? value) {
    return value == null ? null : MaterialStateProperty.all<T>(value);
  }

  PillStyle? themeStyleOf(
    BuildContext context,
  ) {
    return PillTheme.of(context).style;
  }

  bool get enabled => onPressed != null;

  @override
  State<Pill> createState() => _PillState();
}

class _PillState extends State<Pill>
    with MaterialStateMixin, TickerProviderStateMixin {
  AnimationController? _controller;
  Color? _backgroundColor;

  @override
  void initState() {
    super.initState();
    setMaterialState(MaterialState.disabled, !widget.enabled);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Pill oldWidget) {
    super.didUpdateWidget(oldWidget);
    setMaterialState(MaterialState.disabled, !widget.enabled);
    // If the button is disabled while a press gesture is currently ongoing,
    // InkWell makes a call to handleHighlightChanged. This causes an exception
    // because it calls setState in the middle of a build. To preempt this, we
    // manually update pressed to false when this situation occurs.
    if (isDisabled && isPressed) {
      removeMaterialState(MaterialState.pressed);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final widgetStyle = widget.style;
    final themeStyle = widget.themeStyleOf(context);
    final defaultStyle = widget.defaultStyleOf(context);

    T? effectiveValue<T>(T? Function(PillStyle?) getProperty) {
      final T? widgetValue = getProperty(widgetStyle);
      final T? themeValue = getProperty(themeStyle);
      final T? defaultValue = getProperty(defaultStyle);
      return widgetValue ?? themeValue ?? defaultValue;
    }

    T? resolve<T>(MaterialStateProperty<T?>? Function(PillStyle?) getProperty) {
      return effectiveValue(
        (style) => getProperty(style)?.resolve(materialStates),
      );
    }

    var backgroundColor = resolve(
      (style) => style?.backgroundColor,
    )!;
    final foregroundColor = resolve(
      (style) => style?.foregroundColor,
    )!;
    final padding = resolve(
      (style) => style?.padding,
    )!;
    final side = resolve(
      (style) => style?.side,
    )!;
    final textStyle = resolve(
      (style) => style?.textStyle,
    )!
        .copyWith(
      color: foregroundColor,
    );
    final animationDuration = effectiveValue(
      (style) => style?.animationDuration,
    )!;

    if (animationDuration > Duration.zero &&
        _backgroundColor != null &&
        _backgroundColor!.value != backgroundColor.value &&
        _backgroundColor!.opacity == 1 &&
        backgroundColor.opacity < 1) {
      if (_controller?.duration != animationDuration) {
        _controller?.dispose();
        // does this not belong into the did update widget?
        _controller = AnimationController(
          duration: animationDuration,
          vsync: this,
        )..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              // Rebuild with the final background color.
              setState(() {});
            }
          });
      }
      // Defer changing the background color.
      backgroundColor = _backgroundColor!;
      _controller!.value = 0;
      _controller!.forward();
    }
    _backgroundColor = backgroundColor;

    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          // Should be generated by render box.
          padding.vertical + textStyle.fontSize!,
        ),
      ),
    );

    final result = Material(
      elevation: 0,
      color: backgroundColor,
      textStyle: textStyle,
      shape: shape.copyWith(
        side: side,
      ),
      type: MaterialType.button,
      animationDuration: animationDuration,
      child: InkWell(
        onTap: widget.onPressed,
        highlightColor: Colors.transparent,
        customBorder: shape,
        canRequestFocus: widget.enabled,
        child: IconTheme.merge(
          data: IconThemeData(color: foregroundColor),
          child: Padding(
            padding: padding,
            child: widget.child,
          ),
        ),
      ),
    );

    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: result,
    );
  }
}

@immutable
class _PillDefaultBackground extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _PillDefaultBackground(
    this.primary,
    this.onSurface,
  );

  final Color? primary;
  final Color? onSurface;

  @override
  Color? resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return onSurface?.withOpacity(0.12);
    }
    return primary;
  }
}

@immutable
class _PillDefaultForeground extends MaterialStateProperty<Color?>
    with Diagnosticable {
  _PillDefaultForeground(
    this.onPrimary,
    this.onSurface,
  );

  final Color? onPrimary;
  final Color? onSurface;

  @override
  Color? resolve(
    Set<MaterialState> states,
  ) {
    if (states.contains(MaterialState.disabled)) {
      return onSurface?.withOpacity(0.38);
    }
    return onPrimary;
  }
}
