import 'dart:ui';

import 'package:bar/bar.dart';
import 'package:flutter/material.dart';

//?? Element
/// A `BarDivider` class that implements the `BarElement` interface.
///
/// This class represents a divider element for a sidebar with optional
/// style properties. It provides a concrete implementation
/// of the `BarElement` interface.
@immutable
final class BarDivider implements BarElement {
  /// The style of the divider, which can include properties like thickness and color.
  final BarDividerTheme? style;

  /// Creates a `BarDivider` with the given optional style.
  ///
  /// The [style] parameter is optional and can be null.
  const BarDivider({
    this.style,
  });
}


//?? Theme
/// A theme extension class for defining the appearance of a divider in a bar.
///
/// This class provides properties to customize the thickness and color of the divider.
@immutable
class BarDividerTheme {
  /// The thickness of the divider.
  ///
  /// Defaults to 2.0.
  final double thickness;

  /// The color of the divider.
  ///
  /// Defaults to `Colors.grey`.
  final Color color;

  /// Creates a `BarDividerTheme`.
  ///
  /// Both [thickness] and [color] are optional. If not provided, they default to 2.0 and `Colors.grey`, respectively.
  const BarDividerTheme({
    this.thickness = 2.0,
    this.color = Colors.grey,
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// If [thickness] or [color] are not provided, the current values will be used.
  BarDividerTheme copyWith({
    double? thickness,
    Color? color,
  }) {
    return BarDividerTheme(
      thickness: thickness ?? this.thickness,
      color: color ?? this.color,
    );
  }

  /// Linearly interpolates between two `BarDividerTheme` objects.
  ///
  /// The parameter [t] represents a fraction between 0.0 and 1.0 and is used to interpolate
  /// the values of [thickness] and [color] between the objects [a] and [b].
  ///
  /// If both [a] and [b] are `null`, this method returns `null`.
  /// If [a] and [b] are identical, this method returns `null`.
  static BarDividerTheme? lerp(
      BarDividerTheme? a, BarDividerTheme? b, double t) {
    if (identical(a, b)) {
      return null;
    }
    return BarDividerTheme(
      thickness: lerpDouble(a?.thickness, b?.thickness, t) ?? 2.0,
      color: Color.lerp(a?.color, b?.color, t) ?? Colors.grey,
    );
  }
}
