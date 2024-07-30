import 'dart:ui';

import 'package:bar/bar.dart';
import 'package:flutter/material.dart';


/// A theme extension class for defining the appearance of a sidebar.
///
/// This class provides properties to customize the sidebar.
@immutable
class BarTheme extends ThemeExtension<BarTheme> {
  /// The background color of the sidebar.
  ///
  /// This property is optional and can be null.
  final Color? backgroundColor;

  /// The width of the sidebar when it is expanded.
  ///
  /// Defaults to 250.0.
  final double expandedWidth;

  /// The width of the sidebar when it is compact.
  ///
  /// Defaults to 70.0.
  final double compactWidth;

  /// The border of the sidebar.
  ///
  /// This property is optional and can be null.
  final BoxBorder? border;

  /// The border radius of the sidebar.
  ///
  /// This property is optional and can be null.
  final BorderRadiusGeometry? borderRadius;

  /// The padding of the sidebar.
  ///
  /// Defaults to `EdgeInsets.all(8.0)`.
  final EdgeInsetsGeometry? padding;

  /// The style of the dividers in the sidebar.
  ///
  /// Defaults to a `BarDividerTheme` with default values.
  final BarDividerTheme barDividerStyle;

  /// The style of the bar items in the sidebar.
  ///
  /// Defaults to a `BarItemTheme` with default values.
  final BarItemTheme barItemStyle;

  /// Creates a `BarTheme`.
  const BarTheme({
    this.backgroundColor,
    this.expandedWidth = 250.0,
    this.compactWidth = 70.0,
    this.border,
    this.borderRadius,
    this.padding = const EdgeInsets.all(8.0),
    this.barDividerStyle = const BarDividerTheme(),
    this.barItemStyle = const BarItemTheme(),
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// If any of the parameters are not provided, the current values will be used.
  @override
  BarTheme copyWith({
    Duration? animationDuration,
    Alignment? animationAlignment,
    Curve? animationCurve,
    Color? backgroundColor,
    double? expandedWidth,
    double? compactWidth,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    BarDividerTheme? barDividerStyle,
    BarItemTheme? barItemStyle,
  }) {
    return BarTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      expandedWidth: expandedWidth ?? this.expandedWidth,
      compactWidth: compactWidth ?? this.compactWidth,
      border: border ?? this.border,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      barDividerStyle: barDividerStyle ?? this.barDividerStyle,
      barItemStyle: barItemStyle ?? this.barItemStyle,
    );
  }

  /// Linearly interpolates between two `BarTheme` objects.
  ///
  /// The parameter [t] represents a fraction between 0.0 and 1.0 and is used to interpolate.
  /// If [a] is null, this method returns [b] scaled by [t].
  /// If [b] is null, this method returns [a] scaled by 1 - [t].
  @override
  BarTheme lerp(BarTheme? other, double t) {
    if (other == null) return this;
    return BarTheme(
      backgroundColor:
          Color.lerp(backgroundColor, other.backgroundColor, t) ?? Colors.white,
      expandedWidth:
          lerpDouble(expandedWidth, other.expandedWidth, t) ?? expandedWidth,
      compactWidth:
          lerpDouble(compactWidth, other.compactWidth, t) ?? compactWidth,
      border: BoxBorder.lerp(border, other.border, t),
      borderRadius:
          BorderRadiusGeometry.lerp(borderRadius, other.borderRadius, t),
      padding: EdgeInsetsGeometry.lerp(padding, other.padding, t) ?? padding,
      barDividerStyle:
          BarDividerTheme.lerp(barDividerStyle, other.barDividerStyle, t) ??
              barDividerStyle,
      barItemStyle: BarItemTheme.lerp(barItemStyle, other.barItemStyle, t) ??
          barItemStyle,
    );
  }
}