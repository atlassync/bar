import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sidebar/sidebar.dart';

//?? Element
/// Represents an item in a sidebar.
///
/// This class can contain various UI elements and behaviors, including
/// customization options for its appearance and interaction.
@immutable
final class SideBarItem implements IndexableSideBarElement {
  /// The index of the sidebar item.
  ///
  /// This value determines the position of the item within the sidebar.
  @override
  final int index;

  /// The leading widget for the sidebar item.
  ///
  /// This property allows you to provide a widget to be displayed before
  /// the main content of the item. It can be `null`.
  final Widget Function(bool selected)? leading;

  /// The title of the sidebar item.
  ///
  /// This property allows you to provide a title for the item. The title
  /// can vary depending on the selection state and can be `null`.
  final String Function(bool selected)? title;

  /// The trailing widget for the sidebar item.
  ///
  /// This property allows you to provide a widget to be displayed after
  /// the main content of the item. It can be `null`.
  final Widget Function(bool selected)? trailing;

  /// The callback function to be called when the item is selected.
  ///
  /// This function is triggered when the item is selected and can be used
  /// to handle the selection event. It can be `null`.
  final Function(int)? onSelected;

  /// Determines whether selecting the item should trigger an index change.
  ///
  /// When set to `true`, selecting the item will cause an index change.
  /// Defaults to `true`.
  final bool navigate;

  /// The style for the sidebar item.
  ///
  /// This property allows customization of the item's appearance. It can be `null`.
  final SideBarItemTheme? style;

  /// Creates a `SideBarItem` with the given properties.
  ///
  /// All parameters are optional and default values are used if not provided.
  const SideBarItem({
    this.leading,
    this.title,
    this.trailing,
    this.onSelected,
    this.navigate = true,
    this.style,
    this.index = -1,
  });

  /// Creates a copy of this sidebar item with the given fields replaced with new values.
  ///
  /// Parameters that are not provided will retain their current values.
  @override
  SideBarItem copyWith({
    Widget Function(bool selected)? leading,
    String Function(bool selected)? title,
    Widget Function(bool selected)? trailing,
    Function(int)? onSelected,
    bool? navigate,
    SideBarItemTheme? style,
    int? index,
  }) {
    return SideBarItem(
      leading: leading ?? this.leading,
      title: title ?? this.title,
      trailing: trailing ?? this.trailing,
      onSelected: onSelected ?? this.onSelected,
      navigate: navigate ?? this.navigate,
      style: style ?? this.style,
      index: index ?? this.index,
    );
  }
}

/// Specifies the alignment of the sidebar indicator.
enum SideBarIndicatorAlign {
  /// Aligns the indicator to the start of the sidebar item.
  start,

  /// Aligns the indicator to the end of the sidebar item.
  end,
}

/// Defines the appearance of an item in a sidebar.
///
/// This class provides properties for customizing the visual aspects and layout
/// of the sidebar item.
@immutable
class SideBarItemTheme {
  /// The style of the title text.
  ///
  /// This property allows you to define the text style for the title of the item.
  final TextStyle? titleStyle;

  /// The style of the title text when the item is selected.
  ///
  /// This property allows you to define the text style for the title when the item
  /// is selected.
  final TextStyle? selectedTitleStyle;

  /// The background color of the item.
  ///
  /// This property defines the background color of the item. Defaults to `Colors.transparent`.
  final Color backgroundColor;

  /// The background color of the item when it is selected.
  ///
  /// This property defines the background color of the item when it is selected.
  /// Defaults to `Colors.transparent`.
  final Color selectedBackgroundColor;

  /// The background color of the item when it is hovered over.
  ///
  /// This property defines the background color of the item when it is hovered over.
  /// Defaults to `Colors.grey`.
  final Color hoverBackgroundColor;

  /// The color of the indicator shown when the item is selected.
  ///
  /// This property defines the color of the indicator when the item is selected.
  /// Defaults to `Colors.blue`.
  final Color selectedIndicatorColor;

  /// The width of the indicator shown when the item is selected.
  ///
  /// This property defines the width of the indicator when the item is selected.
  /// Defaults to `2.0`.
  final double selectedIndicatorWidth;

  /// Whether to show the indicator when the item is selected.
  ///
  /// This property determines if the indicator should be shown when the item is selected.
  /// Defaults to `true`.
  final bool showSelectedIndicator;

  /// The alignment of the indicator shown when the item is selected.
  ///
  /// This property defines the alignment of the indicator when the item is selected.
  /// Defaults to `SideBarIndicatorAlign.start`.
  final SideBarIndicatorAlign indicatorAlign;

  /// The gap between the item's content.
  ///
  /// This property defines the space between the content elements of the item.
  /// Defaults to `8.0`.
  final double gap;

  /// The padding around the content of the sidebar item.
  ///
  /// This property defines the space between the item's content and its boundary.
  /// Defaults to `EdgeInsets.all(8.0)`.
  final EdgeInsetsGeometry padding;

  /// The margin around the content of the sidebar item.
  ///
  /// This property defines the space outside the boundary of the item.
  /// Defaults to `EdgeInsets.all(8.0)`.
  final EdgeInsetsGeometry margin;

  /// The border radius of the sidebar item.
  ///
  /// This property defines the curvature of the item's corners.
  /// Defaults to `BorderRadius.circular(4.0)`.
  final BorderRadiusGeometry borderRadius;

  /// Creates a `SideBarItemTheme` with the given properties.
  ///
  /// All parameters are optional, with default values provided where applicable.
  const SideBarItemTheme({
    this.titleStyle,
    this.selectedTitleStyle,
    this.backgroundColor = Colors.transparent,
    this.selectedBackgroundColor = Colors.transparent,
    this.hoverBackgroundColor = Colors.grey,
    this.selectedIndicatorColor = Colors.blue,
    this.selectedIndicatorWidth = 2.0,
    this.showSelectedIndicator = true,
    this.indicatorAlign = SideBarIndicatorAlign.start,
    this.gap = 8.0,
    this.padding = const EdgeInsets.all(8.0),
    this.margin = const EdgeInsets.all(8.0),
    this.borderRadius = const BorderRadius.all(Radius.circular(4.0)),
  });

  /// Creates a copy of this theme with the given fields replaced with new values.
  ///
  /// Parameters that are not provided will retain their current values.
  SideBarItemTheme copyWith({
    TextStyle? titleStyle,
    TextStyle? selectedTitleStyle,
    Color? backgroundColor,
    Color? selectedBackgroundColor,
    Color? hoverBackgroundColor,
    Color? selectedIndicatorColor,
    double? selectedIndicatorWidth,
    bool? showSelectedIndicator,
    SideBarIndicatorAlign? indicatorAlign,
    double? gap,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BorderRadiusGeometry? borderRadius,
  }) {
    return SideBarItemTheme(
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
      indicatorAlign: indicatorAlign ?? this.indicatorAlign,
      gap: gap ?? this.gap,
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  /// Linearly interpolates between two `SideBarItemTheme` objects.
  ///
  /// The parameter [t] represents a fraction between 0.0 and 1.0 and is used to interpolate
  /// the values of the properties between the objects [a] and [b].
  ///
  /// If both [a] and [b] are `null`, this method returns `null`.
  static SideBarItemTheme? lerp(
      SideBarItemTheme? a, SideBarItemTheme? b, double t) {
    if (identical(a, b)) return null;
    return SideBarItemTheme(
      titleStyle: TextStyle.lerp(a?.titleStyle, b?.titleStyle, t),
      selectedTitleStyle:
          TextStyle.lerp(a?.selectedTitleStyle, b?.selectedTitleStyle, t),
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t) ??
          Colors.transparent,
      selectedBackgroundColor: Color.lerp(
              a?.selectedBackgroundColor, b?.selectedBackgroundColor, t) ??
          Colors.transparent,
      hoverBackgroundColor:
          Color.lerp(a?.hoverBackgroundColor, b?.hoverBackgroundColor, t) ??
              Colors.grey,
      selectedIndicatorColor:
          Color.lerp(a?.selectedIndicatorColor, b?.selectedIndicatorColor, t) ??
              Colors.blue,
      selectedIndicatorWidth:
          lerpDouble(a?.selectedIndicatorWidth, b?.selectedIndicatorWidth, t) ??
              2.0,
      showSelectedIndicator: t < 0.5
          ? (a?.showSelectedIndicator ?? true)
          : (b?.showSelectedIndicator ?? true),
      indicatorAlign: t < 0.5
          ? (a?.indicatorAlign ?? SideBarIndicatorAlign.start)
          : (b?.indicatorAlign ?? SideBarIndicatorAlign.start),
      gap: lerpDouble(a?.gap, b?.gap, t) ?? 8.0,
      padding: EdgeInsetsGeometry.lerp(a?.padding, b?.padding, t) ??
          const EdgeInsets.all(8.0),
      margin: EdgeInsetsGeometry.lerp(a?.margin, b?.margin, t) ??
          const EdgeInsets.all(8.0),
      borderRadius:
          BorderRadiusGeometry.lerp(a?.borderRadius, b?.borderRadius, t) ??
              const BorderRadius.all(Radius.circular(4.0)),
    );
  }
}