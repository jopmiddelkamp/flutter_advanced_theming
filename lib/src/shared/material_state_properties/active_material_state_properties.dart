import 'package:flutter/material.dart';

@immutable
class ActiveMaterialStateProperty<T> extends MaterialStateProperty<T> {
  ActiveMaterialStateProperty({
    required this.active,
    required this.disabled,
  });

  ActiveMaterialStateProperty.all(
    T value,
  )   : active = value,
        disabled = value;

  final T active;
  final T disabled;

  @override
  T resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    return active;
  }
}
