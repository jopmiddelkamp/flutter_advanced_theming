import 'package:flutter/material.dart';

import '../../src.dart';

enum CustomPillColorSchemes {
  primary,
}

const _defaultColorScheme = CustomPillColorSchemes.primary;

class CustomPill extends ImplicitlyAnimatedWidget {
  const CustomPill({
    super.key,
    super.duration = const Duration(milliseconds: 200),
    this.colorScheme = _defaultColorScheme,
    required this.child,
    VoidCallback? onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.textStyle,
    this.padding,
    this.enabled = true,
    bool selected = false,
  })  : selected = enabled ? selected : false,
        onPressed = enabled ? onPressed : null;

  final CustomPillColorSchemes colorScheme;

  final Widget child;
  final VoidCallback? onPressed;

  final ActiveMaterialStateProperty<Color>? backgroundColor;
  final ActiveMaterialStateProperty<Color>? foregroundColor;
  final ActiveMaterialStateProperty<TextStyle>? textStyle;
  final ActiveMaterialStateProperty<EdgeInsetsGeometry>? padding;
  final bool enabled;
  final bool selected;

  @override
  AnimatedWidgetBaseState<CustomPill> createState() => _CustomPillState();
}

class _CustomPillState extends AnimatedWidgetBaseState<CustomPill>
    with MaterialStateMixin {
  Color? _backgroundColor;
  Color? _foregroundColor;
  TextStyle? _textStyle;
  EdgeInsetsGeometry? _padding;

  ColorTween? _backgroundColorTween;
  ColorTween? _foregroundColorTween;
  EdgeInsetsGeometryTween? _paddingTween;
  TextStyleTween? _textStyleTween;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _backgroundColorTween = visitor(_backgroundColorTween, _backgroundColor,
        (dynamic value) => ColorTween(begin: value as Color)) as ColorTween?;
    _foregroundColorTween = visitor(_foregroundColorTween, _foregroundColor,
        (dynamic value) => ColorTween(begin: value as Color)) as ColorTween?;
    _paddingTween = visitor(
            _paddingTween,
            _padding,
            (dynamic value) =>
                EdgeInsetsGeometryTween(begin: value as EdgeInsetsGeometry))
        as EdgeInsetsGeometryTween?;
    _textStyleTween = visitor(_textStyleTween, _textStyle,
            (dynamic value) => TextStyleTween(begin: value as TextStyle))
        as TextStyleTween?;
  }

  @override
  void initState() {
    super.initState();
    setMaterialState(MaterialState.disabled, !widget.enabled);
    setMaterialState(MaterialState.selected, widget.selected);
  }

  @override
  void didUpdateWidget(covariant CustomPill oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.enabled != widget.enabled) {
      setMaterialState(MaterialState.disabled, !widget.enabled);
    }
    if (oldWidget.selected != widget.selected) {
      setMaterialState(MaterialState.selected, widget.selected);
    }
    // If the button is disabled while a press gesture is currently ongoing,
    // InkWell makes a call to handleHighlightChanged. This causes an exception
    // because it calls setState in the middle of a build. To preempt this, we
    // manually update pressed to false when this situation occurs.
    if (isDisabled && isSelected) {
      removeMaterialState(MaterialState.selected);
    }

    final theme = CustomPillTheme.of(context);
    final colorScheme = _getColorScheme(theme);
    if (oldWidget.backgroundColor != widget.backgroundColor) {
      _backgroundColor = _getBackgroundColor(colorScheme);
    }
    if (oldWidget.foregroundColor != widget.foregroundColor) {
      _foregroundColor = _getForegroundColor(colorScheme);
    }
    if (oldWidget.padding != widget.padding) {
      _padding = _getPadding(theme);
    }
    if (oldWidget.textStyle != widget.textStyle) {
      _textStyle = _getTextStyle(theme);
    }
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = CustomPillTheme.of(context);
    final colorScheme = _getColorScheme(theme);
    return Semantics(
      container: true,
      button: true,
      enabled: widget.enabled,
      child: Container(
        decoration: ShapeDecoration(
          shape: const StadiumBorder(),
          color: _backgroundColorTween?.evaluate(animation) ??
              _getBackgroundColor(colorScheme),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.enabled ? widget.onPressed : null,
            child: Padding(
              padding: _paddingTween?.evaluate(animation) ?? _getPadding(theme),
              child: CustomMergeForegroundColor(
                color: _foregroundColorTween?.evaluate(animation) ??
                    _getForegroundColor(colorScheme),
                child: CustomMergeStyles.textOnly(
                  textStyle: _textStyleTween?.evaluate(animation) ??
                      _getTextStyle(theme),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBackgroundColor(
    CustomPillColorScheme colorScheme,
  ) {
    return resolve(
      widget.backgroundColor,
      colorScheme.backgroundColor,
      materialStates,
    );
  }

  Color _getForegroundColor(
    CustomPillColorScheme colorScheme,
  ) {
    return resolve(
      widget.foregroundColor,
      colorScheme.foregroundColor,
      materialStates,
    );
  }

  EdgeInsetsGeometry _getPadding(
    CustomPillTheme theme,
  ) {
    return resolve(
      widget.padding,
      theme.padding,
      materialStates,
    );
  }

  TextStyle _getTextStyle(
    CustomPillTheme theme,
  ) {
    return resolve(
      widget.textStyle,
      theme.textStyle,
      materialStates,
    );
  }

  CustomPillColorScheme _getColorScheme(
    CustomPillTheme theme,
  ) {
    switch (widget.colorScheme) {
      case CustomPillColorSchemes.primary:
        return theme.primaryColorScheme;
    }
  }
}
