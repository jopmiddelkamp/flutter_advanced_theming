import 'package:flutter/material.dart';

@immutable
class SelectableMaterialStateProperty<T> extends MaterialStateProperty<T> {
  SelectableMaterialStateProperty({
    required this.active,
    required this.selected,
    required this.disabled,
  });

  SelectableMaterialStateProperty.all(
    T value,
  )   : active = value,
        selected = value,
        disabled = value;

  final T active;
  final T selected;
  final T disabled;

  @override
  T resolve(Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return disabled;
    }
    if (states.contains(MaterialState.selected)) {
      return selected;
    }
    return active;
  }
}
