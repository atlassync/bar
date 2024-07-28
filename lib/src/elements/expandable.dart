import 'dart:ui';

import 'package:bar/bar.dart';
import 'package:flutter/material.dart';

//?? Element
/// An `ExpandableBarItem` class that implements the `BarElement` interface.
///
/// This class represents an expandable item in a sidebar. It can contain
/// leading and trailing widgets, a title, a list of nested `BarElement`
/// elements, and a callback for changes.
@immutable
final class ExpandableBarItem implements BarElement {
  /// The leading widget for the expandable item.
  ///
  /// This property is optional and can be null.
  final Widget? leading;

  /// The title of the expandable item.
  ///
  /// This property is optional and can be null.
  final String? title;

  /// The trailing widget for the expandable item.
  ///
  /// This property is optional and can be null.
  final Widget? trailing;

  /// The list of nested elements within this expandable item.
  ///
  /// This property is required and cannot be null.
  final List<BarElement> elements;

  /// The style for the expandable item.
  ///
  /// This property is optional and can be null.
  final ExpandableBarItemTheme? style;

  /// Indicates whether the item is initially collapsed.
  ///
  /// Defaults to `true`.
  final bool collapsed;

  /// Creates an `ExpandableBarItem` with the given properties.
  ///
  /// The [elements] parameter is required and must be provided.
  /// The [leading], [title], [trailing], [onChanged], and [style] parameters are optional.
  /// The [collapsed] parameter defaults to `true`.
  const ExpandableBarItem({
    this.leading,
    this.title,
    this.trailing,
    required this.elements,
    this.style,
    this.collapsed = true,
  });

  /// Creates a copy of this `ExpandableBarItem` with the given fields replaced with new values.
  ///
  /// If any of the parameters are not provided, the current values will be used.
  ExpandableBarItem copyWith({
    Widget? leading,
    String? title,
    Widget? trailing,
    List<BarElement>? elements,
    ExpandableBarItemTheme? style,
    bool? collapsed,
  }) {
    return ExpandableBarItem(
      leading: leading ?? this.leading,
      title: title ?? this.title,
      trailing: trailing ?? this.trailing,
      elements: elements ?? this.elements,
      style: style ?? this.style,
      collapsed: collapsed ?? this.collapsed,
    );
  }
}


//?? Theme
/// A theme extension class for defining the appearance of an expandable bar item.
///
/// This class provides properties to customize the text styles and background colors
/// for the expandable bar item in both its collapsed and expanded states, as well as the gap between items.
@immutable
class ExpandableBarItemTheme {
  /// The text style of the title in its collapsed state.
  final TextStyle? titleStyle;

  /// The text style of the title in its expanded state.
  final TextStyle? expandedTitleStyle;

  /// The background color of the item in its collapsed state.
  ///
  /// Defaults to `Colors.transparent`.
  final Color backgroundColor;

  /// The background color of the item in its expanded state.
  ///
  /// Defaults to `Colors.black12`.
  final Color expandedBackgroundColor;

  /// The gap between items.
  ///
  /// Defaults to 8.0.
  final double gap;

  /// Creates an `ExpandableBarItemTheme`.
  ///
  /// The [titleStyle] and [expandedTitleStyle] properties are optional.
  /// The [backgroundColor], [expandedBackgroundColor], and [gap] properties have default values.
  const ExpandableBarItemTheme({
    this.titleStyle,
    this.expandedTitleStyle,
    this.backgroundColor = Colors.transparent,
    this.expandedBackgroundColor = Colors.black12,
    this.gap = 8.0,
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// If any of the parameters are not provided, the current values will be used.
  ExpandableBarItemTheme copyWith({
    TextStyle? titleStyle,
    TextStyle? expandedTitleStyle,
    Color? backgroundColor,
    Color? expandedBackgroundColor,
    double? gap,
  }) {
    return ExpandableBarItemTheme(
      titleStyle: titleStyle ?? this.titleStyle,
      expandedTitleStyle: expandedTitleStyle ?? this.expandedTitleStyle,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      expandedBackgroundColor:
          expandedBackgroundColor ?? this.expandedBackgroundColor,
      gap: gap ?? this.gap,
    );
  }

  /// Linearly interpolates between two `ExpandableBarItemTheme` objects.
  ///
  /// The parameter [t] represents a fraction between 0.0 and 1.0 and is used to interpolate
  /// the values of [titleStyle], [expandedTitleStyle], [backgroundColor], [expandedBackgroundColor],
  /// and [gap] between the objects [a] and [b].
  ///
  /// If both [a] and [b] are `null`, this method returns `null`.
  static ExpandableBarItemTheme? lerp(
      ExpandableBarItemTheme? a, ExpandableBarItemTheme? b, double t) {
    if (a == null && b == null) {
      return null;
    }
    return ExpandableBarItemTheme(
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      expandedTitleStyle:
          TextStyle.lerp(a?.expandedTitleStyle, b?.expandedTitleStyle, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t) ??
          Colors.transparent,
      expandedBackgroundColor: Color.lerp(
              a?.expandedBackgroundColor, b?.expandedBackgroundColor, t) ??
          Colors.transparent,
      gap: lerpDouble(a?.gap, b?.gap, t) ?? 0.0,
    );
  }
}
