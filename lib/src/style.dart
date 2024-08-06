import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sidebar/sidebar.dart';

// A theme extension class for defining the appearance of a sidebar.
//
// This class provides properties to customize various aspects of the sidebar,
// including its background color, width, border, and styling of dividers and items.
@immutable
class SideBarTheme extends ThemeExtension<SideBarTheme> {
  /// The background color of the sidebar.
  ///
  /// This property is optional and can be `null`.
  final Color? backgroundColor;

  /// The width of the sidebar when it is expanded.
  ///
  /// Defaults to `250.0`.
  final double expandedWidth;

  /// The width of the sidebar when it is compact.
  ///
  /// Defaults to `70.0`.
  final double compactWidth;

  /// The border of the sidebar.
  ///
  /// This property is optional and can be `null`.
  final BoxBorder? border;

  /// The border radius of the sidebar.
  ///
  /// This property is optional and can be `null`.
  final BorderRadiusGeometry? borderRadius;

  /// The padding of the sidebar.
  ///
  /// Defaults to `EdgeInsets.all(8.0)`.
  final EdgeInsetsGeometry padding;

  /// The style of the dividers in the sidebar.
  ///
  /// Defaults to a `SideBarDividerTheme` with default values.
  final SideBarDividerTheme barDividerStyle;

  /// The style of the sidebar items in the sidebar.
  ///
  /// Defaults to a `SideBarItemTheme` with default values.
  final SideBarItemTheme barItemStyle;

  /// Creates a `SideBarTheme`.
  ///
  /// All parameters are optional. If not provided, defaults are used where applicable.
  const SideBarTheme({
    this.backgroundColor,
    this.expandedWidth = 250.0,
    this.compactWidth = 70.0,
    this.border,
    this.borderRadius,
    this.padding = const EdgeInsets.all(8.0),
    this.barDividerStyle = const SideBarDividerTheme(),
    this.barItemStyle = const SideBarItemTheme(),
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// If any parameter is not provided, the current value will be used.
  @override
  SideBarTheme copyWith({
    Color? backgroundColor,
    double? expandedWidth,
    double? compactWidth,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? padding,
    SideBarDividerTheme? barDividerStyle,
    SideBarItemTheme? barItemStyle,
  }) {
    return SideBarTheme(
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

  /// Linearly interpolates between two `SideBarTheme` objects.
  ///
  /// The parameter [t] represents a fraction between 0.0 and 1.0 and is used to interpolate
  /// the properties between the objects [this] and [other].
  ///
  /// If [other] is `null`, this method returns the current instance scaled by `1 - t`.
  /// If [this] is `null`, this method returns [other] scaled by `t`.
  @override
  SideBarTheme lerp(SideBarTheme? other, double t) {
    if (other == null) return this;
    return SideBarTheme(
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
          SideBarDividerTheme.lerp(barDividerStyle, other.barDividerStyle, t) ??
              barDividerStyle,
      barItemStyle: SideBarItemTheme.lerp(barItemStyle, other.barItemStyle, t) ??
          barItemStyle,
    );
  }
}