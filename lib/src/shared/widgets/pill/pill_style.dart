import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PillStyle extends Equatable {
  const PillStyle({
    this.textStyle,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.side,
    this.animationDuration,
  });

  final MaterialStateProperty<TextStyle?>? textStyle;

  final MaterialStateProperty<Color?>? backgroundColor;

  final MaterialStateProperty<Color?>? foregroundColor;

  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;

  final MaterialStateProperty<BorderSide?>? side;

  final Duration? animationDuration;

  PillStyle copyWith({
    MaterialStateProperty<TextStyle?>? textStyle,
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<Color?>? foregroundColor,
    MaterialStateProperty<EdgeInsetsGeometry?>? padding,
    MaterialStateProperty<BorderSide?>? side,
    Duration? animationDuration,
  }) {
    return PillStyle(
      textStyle: textStyle ?? this.textStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      foregroundColor: foregroundColor ?? this.foregroundColor,
      padding: padding ?? this.padding,
      side: side ?? this.side,
      animationDuration: animationDuration ?? this.animationDuration,
    );
  }

  PillStyle merge(
    PillStyle style,
  ) {
    return copyWith(
      textStyle: textStyle ?? style.textStyle,
      backgroundColor: backgroundColor ?? style.backgroundColor,
      foregroundColor: foregroundColor ?? style.foregroundColor,
      padding: padding ?? style.padding,
      side: side ?? style.side,
      animationDuration: animationDuration ?? style.animationDuration,
    );
  }

  @override
  List<Object?> get props => [
        textStyle,
        backgroundColor,
        foregroundColor,
        padding,
        side,
        animationDuration,
      ];

  static PillStyle lerp(
    PillStyle? a,
    PillStyle? b,
    double t,
  ) {
    return PillStyle(
      textStyle: _lerpProperties(
        a?.textStyle,
        b?.textStyle,
        t,
        TextStyle.lerp,
      ),
      backgroundColor: _lerpProperties(
        a?.backgroundColor,
        b?.backgroundColor,
        t,
        Color.lerp,
      ),
      foregroundColor: _lerpProperties(
        a?.foregroundColor,
        b?.foregroundColor,
        t,
        Color.lerp,
      ),
      padding: _lerpProperties(
        a?.padding,
        b?.padding,
        t,
        EdgeInsetsGeometry.lerp,
      ),
      side: _lerpSides(
        a?.side,
        b?.side,
        t,
      ),
      animationDuration: t < 0.5 ? a?.animationDuration : b?.animationDuration,
    );
  }

  static MaterialStateProperty<T?>? _lerpProperties<T>(
    MaterialStateProperty<T?>? a,
    MaterialStateProperty<T?>? b,
    double t,
    T? Function(T?, T?, double) lerpFunction,
  ) {
    if (a == null && b == null) {
      return null;
    }
    return _LerpProperties<T>(a, b, t, lerpFunction);
  }

  static MaterialStateProperty<BorderSide?>? _lerpSides(
    MaterialStateProperty<BorderSide?>? a,
    MaterialStateProperty<BorderSide?>? b,
    double t,
  ) {
    if (a == null && b == null) {
      return null;
    }
    return _LerpSides(a, b, t);
  }
}

class _LerpProperties<T> implements MaterialStateProperty<T?> {
  const _LerpProperties(
    this.a,
    this.b,
    this.t,
    this.lerpFunction,
  );

  final MaterialStateProperty<T?>? a;
  final MaterialStateProperty<T?>? b;
  final double t;
  final T? Function(T?, T?, double) lerpFunction;

  @override
  T? resolve(
    Set<MaterialState> states,
  ) {
    final T? resolvedA = a?.resolve(states);
    final T? resolvedB = b?.resolve(states);
    return lerpFunction(resolvedA, resolvedB, t);
  }
}

class _LerpSides implements MaterialStateProperty<BorderSide?> {
  const _LerpSides(
    this.a,
    this.b,
    this.t,
  );

  final MaterialStateProperty<BorderSide?>? a;
  final MaterialStateProperty<BorderSide?>? b;
  final double t;

  @override
  BorderSide? resolve(
    Set<MaterialState> states,
  ) {
    final BorderSide? resolvedA = a?.resolve(states);
    final BorderSide? resolvedB = b?.resolve(states);
    if (resolvedA == null && resolvedB == null) {
      return null;
    }
    if (resolvedA == null) {
      return BorderSide.lerp(
        BorderSide(width: 0, color: resolvedB!.color.withAlpha(0)),
        resolvedB,
        t,
      );
    }
    if (resolvedB == null) {
      return BorderSide.lerp(
        resolvedA,
        BorderSide(width: 0, color: resolvedA.color.withAlpha(0)),
        t,
      );
    }
    return BorderSide.lerp(resolvedA, resolvedB, t);
  }
}
