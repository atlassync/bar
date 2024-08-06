import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sidebar/sidebar.dart';

//?? Element
/// Represents a divider element in a sidebar.
///
/// The `SideBarDivider` class implements the `SideBarElement` interface and
/// can include optional styling properties to customize its appearance.
@immutable
final class SideBarDivider implements SideBarElement {
  /// The style of the divider.
  ///
  /// This property allows you to specify the appearance of the divider,
  /// including properties like thickness and color. It can be `null`.
  final SideBarDividerTheme? style;

  /// Creates a `SideBarDivider` with the given optional style.
  ///
  /// The [style] parameter is optional and can be `null`.
  const SideBarDivider({
    this.style,
  });
}

//?? Theme
/// Defines the appearance of a divider in a sidebar.
///
/// The `SideBarDividerTheme` class provides properties to customize the
/// thickness and color of the divider.
@immutable
class SideBarDividerTheme {
  /// The thickness of the divider.
  ///
  /// This property defines how thick the divider should be. Defaults to `2.0`.
  final double thickness;

  /// The color of the divider.
  ///
  /// This property defines the color of the divider. Defaults to `Colors.grey`.
  final Color color;

  /// Creates a `SideBarDividerTheme`.
  ///
  /// Both [thickness] and [color] are optional. If not provided, they default to `2.0` and `Colors.grey`, respectively.
  const SideBarDividerTheme({
    this.thickness = 2.0,
    this.color = Colors.grey,
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// If [thickness] or [color] are not provided, the current values will be used.
  SideBarDividerTheme copyWith({
    double? thickness,
    Color? color,
  }) {
    return SideBarDividerTheme(
      thickness: thickness ?? this.thickness,
      color: color ?? this.color,
    );
  }

  /// Linearly interpolates between two `SideBarDividerTheme` objects.
  ///
  /// The parameter [t] represents a fraction between 0.0 and 1.0 and is used to interpolate
  /// the values of [thickness] and [color] between the objects [a] and [b].
  ///
  /// If both [a] and [b] are `null`, this method returns `null`.
  /// If [a] and [b] are identical, this method returns `null`.
  static SideBarDividerTheme? lerp(
      SideBarDividerTheme? a, SideBarDividerTheme? b, double t) {
    if (identical(a, b)) {
      return null;
    }
    return SideBarDividerTheme(
      thickness: lerpDouble(a?.thickness, b?.thickness, t) ?? 2.0,
      color: Color.lerp(a?.color, b?.color, t) ?? Colors.grey,
    );
  }
}
