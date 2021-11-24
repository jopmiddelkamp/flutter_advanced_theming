import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../src.dart';

class PillThemeData extends Equatable with Diagnosticable {
  const PillThemeData({
    this.style,
  });

  final PillStyle? style;

  static PillThemeData? lerp(
    PillThemeData a,
    PillThemeData b,
    double t,
  ) {
    return PillThemeData(
      style: PillStyle.lerp(
        a.style,
        b.style,
        t,
      ),
    );
  }

  PillThemeData copyWith({
    PillStyle? style,
  }) {
    return PillThemeData(
      style: style ?? this.style,
    );
  }

  PillThemeData merge(
    PillThemeData other,
  ) {
    final stylesExist = other.style != null && style != null;

    return copyWith(
      style: stylesExist ? other.style!.merge(style!) : other.style,
    );
  }

  PillThemeData resolve(BuildContext context) => this;

  @override
  List<Object?> get props => [style];
}
