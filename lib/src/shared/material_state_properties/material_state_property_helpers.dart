import 'package:flutter/material.dart';

T resolve<T>(
  MaterialStateProperty<T?>? widget,
  MaterialStateProperty<T> theme,
  Set<MaterialState> states,
) {
  final resolvedWidget = widget?.resolve(states);
  if (resolvedWidget != null) {
    return resolvedWidget;
  }
  final resolvedTheme = theme.resolve(states);

  return resolvedTheme;
}

typedef MaterialPropertyLerpFunction<T> = T Function(T, T, double);

MaterialStateProperty<T> lerpMaterialProperties<T>(
  MaterialStateProperty<T> from,
  MaterialStateProperty<T> to,
  double t,
  MaterialPropertyLerpFunction<T> lerpFunction,
) {
  return _LerpMaterialProperties<T>(from, to, t, lerpFunction);
}

class _LerpMaterialProperties<T> implements MaterialStateProperty<T> {
  const _LerpMaterialProperties(
    this.from,
    this.to,
    this.t,
    this.lerpFunction,
  );

  final MaterialStateProperty<T> from;
  final MaterialStateProperty<T> to;
  final double t;
  final MaterialPropertyLerpFunction<T> lerpFunction;

  @override
  T resolve(Set<MaterialState> states) {
    final T resolvedFrom = from.resolve(states);
    final T resolvedTo = to.resolve(states);
    return lerpFunction(resolvedFrom, resolvedTo, t);
  }
}

ShapeBorder shapeBorderLerp(
  ShapeBorder a,
  ShapeBorder b,
  double t,
) {
  if (a == b) {
    return b;
  }
  return ShapeBorder.lerp(a, b, t)!;
}
