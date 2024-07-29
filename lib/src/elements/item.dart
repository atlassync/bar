import 'dart:ui';

import 'package:bar/bar.dart';
import 'package:flutter/material.dart';

//?? Element
/// A `BarItem` class that implements the `BarElement` interface.
///
/// This class represents an item in a sidebar. It can contain leading and
/// trailing widgets, a title, and a callback for selection.
@immutable
final class BarItem implements IndexableBarElement {
  /// The index of the bar element.
  ///
  /// This property holds the index value for the bar element.
  @override
  final int index;

  /// The leading widget for the sidebar item.
  ///
  /// This property is optional and can be null.
  final Widget? leading;

  /// The title of the sidebar item.
  ///
  /// This property is optional and can be null.
  final String? title;

  /// The trailing widget for the sidebar item.
  ///
  /// This property is optional and can be null.
  final Widget? trailing;

  /// The callback function to be called when the item is selected.
  ///
  /// This property is optional and can be null. It takes an integer parameter.
  final Function(int)? onSelected;

  /// The style for the bar item.
  ///
  /// This property holds the `BarItemTheme` which defines the appearance
  /// of the bar item, including its text styles, background colors,
  /// indicator properties, and spacing.
  final BarItemTheme? style;

  @override
  BarItem copyWith({
    Widget? leading,
    String? title,
    Widget? trailing,
    Function(int)? onSelected,
    BarItemTheme? style,
    int? index,
  }) {
    return BarItem(
      leading: leading ?? this.leading,
      title: title ?? this.title,
      trailing: trailing ?? this.trailing,
      onSelected: onSelected ?? this.onSelected,
      style: style ?? this.style,
      index: index ?? this.index,
    );
  }

  /// Creates a `BarItem` with the given properties.
  ///
  /// The `leading`, `title`, `trailing`, `onSelected` and `style` parameters are optional.
  const BarItem({
    this.leading,
    this.title,
    this.trailing,
    this.onSelected,
    this.style,
    this.index = 0,
  });
}

//?? Theme
/// A theme class for defining the appearance of an item in a sidebar.
///
/// This class provides properties to customize the title style, background colors,
/// indicator appearance, and spacing of the bar item.
@immutable
class BarItemTheme {
  /// The style of the title text.
  final TextStyle? titleStyle;

  /// The style of the title text when the item is selected.
  final TextStyle? selectedTitleStyle;

  /// The background color of the item.
  final Color? backgroundColor;

  /// The background color of the item when it is selected.
  final Color? selectedBackgroundColor;

  /// The background color of the item when it is hovered over.
  final Color? hoverBackgroundColor;

  /// The color of the indicator shown when the item is selected.
  final Color selectedIndicatorColor;

  /// The width of the indicator shown when the item is selected.
  ///
  /// Defaults to 2.0.
  final double selectedIndicatorWidth;

  /// Whether to show the indicator when the item is selected.
  ///
  /// Defaults to true.
  final bool showSelectedIndicator;

  /// The gap between the item's content.
  ///
  /// Defaults to 8.0.
  final double gap;

  /// The padding around the content of the bar item.
  ///
  /// Defaults to `EdgeInsets.all(8.0)`.
  final EdgeInsetsGeometry padding;

  /// The margin around the content of the bar item.
  ///
  /// Defaults to `EdgeInsets.all(8.0)`.
  final EdgeInsetsGeometry margin;

  /// The border radius of the bar item.
  ///
  /// Defaults to `BorderRadius.circular(4.0)`.
  final BorderRadiusGeometry borderRadius;

  /// Creates a `BarItemTheme`.
  ///
  /// All parameters are optional. If not provided, they will have default values
  /// where applicable.
  const BarItemTheme({
    this.titleStyle,
    this.selectedTitleStyle,
    this.backgroundColor,
    this.selectedBackgroundColor,
    this.hoverBackgroundColor,
    this.selectedIndicatorColor = Colors.blue,
    this.selectedIndicatorWidth = 2.0,
    this.showSelectedIndicator = true,
    this.gap = 8.0,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.symmetric(horizontal: 8.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// If any parameter is not provided, the current value will be used.
  BarItemTheme copyWith({
    TextStyle? titleStyle,
    TextStyle? selectedTitleStyle,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? hoverBackgroundColor,
    Color? selectedIndicatorColor,
    double? selectedIndicatorWidth,
    bool? showSelectedIndicator,
    double? gap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
  }) {
    return BarItemTheme(
      titleStyle: titleStyle ?? this.titleStyle,
      selectedTitleStyle: selectedTitleStyle ?? this.selectedTitleStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      selectedBackgroundColor:
          selectedBackgroundColor ?? this.selectedBackgroundColor,
      hoverBackgroundColor: hoverBackgroundColor ?? this.hoverBackgroundColor,
      selectedIndicatorColor:
          selectedIndicatorColor ?? this.selectedIndicatorColor,
      selectedIndicatorWidth:
          selectedIndicatorWidth ?? this.selectedIndicatorWidth,
      showSelectedIndicator:
          showSelectedIndicator ?? this.showSelectedIndicator,
      gap: gap ?? this.gap,
      padding: padding ?? this.padding,
      borderRadius: borderRadius ?? this.borderRadius,
      margin: margin ?? this.margin
    );
  }

  /// Linearly interpolates between two `BarItemTheme` objects.
  ///
  /// The parameter [t] represents a fraction between 0.0 and 1.0 and is used to interpolate
  /// the values of the properties between the objects [a] and [b].
  ///
  /// If both [a] and [b] are `null`, this method returns `null`.
  static BarItemTheme? lerp(BarItemTheme? a, BarItemTheme? b, double t) {
    if (a == null && b == null) return null;
    return BarItemTheme(
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      selectedTitleStyle:
          TextStyle.lerp(a?.selectedTitleStyle, b?.selectedTitleStyle, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      selectedBackgroundColor:
          Color.lerp(a?.selectedBackgroundColor, b?.selectedBackgroundColor, t),
      hoverBackgroundColor:
          Color.lerp(a?.hoverBackgroundColor, b?.hoverBackgroundColor, t),
      selectedIndicatorColor:
          Color.lerp(a?.selectedIndicatorColor, b?.selectedIndicatorColor, t) ??
              Colors.blue,
      selectedIndicatorWidth:
          lerpDouble(a?.selectedIndicatorWidth, b?.selectedIndicatorWidth, t) ??
              2.0,
      showSelectedIndicator: t < 0.5
          ? (a?.showSelectedIndicator ?? true)
          : (b?.showSelectedIndicator ?? true),
      gap: lerpDouble(a?.gap, b?.gap, t) ?? 8.0,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t) ?? const EdgeInsets.all(8.0),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t) ?? const EdgeInsets.symmetric(horizontal: 8.0),
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t) ?? const BorderRadius.all(Radius.circular(4.0)),
    );
  }
}
