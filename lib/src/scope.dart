import 'package:bar/bar.dart';
import 'package:flutter/widgets.dart';

/// A widget that provides access to the `BarController`, `BarTheme`, and `BarMode` 
/// for its descendants.
///
/// The `BarScope` class extends `InheritedWidget` and is used to pass the `BarController`,
/// `BarTheme`, and `BarMode` down the widget tree. It allows widgets to access these 
/// properties without needing to pass them explicitly through constructors.
class BarScope extends InheritedWidget {
  /// The controller that manages the state and behavior of the bar.
  final BarController controller;

  /// The theme that defines the visual styling of the bar.
  final BarTheme theme;

  /// The mode that determines the layout and behavior of the bar.
  final BarMode mode;

  /// Creates a `BarScope` widget.
  ///
  /// The [controller], [theme], [mode], and [child] parameters are required.
  const BarScope({
    super.key,
    required this.controller,
    required this.theme,
    required this.mode,
    required super.child,
  });

  /// Retrieves the nearest `BarScope` instance up the widget tree.
  ///
  /// This method is used to access the `BarScope` instance and its properties from 
  /// the context. Returns the `BarScope` instance if found, otherwise throws an error.
  static BarScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BarScope>()!;
  }

  /// Retrieves the nearest `BarScope` instance up the widget tree, if it exists.
  ///
  /// This method is used to access the `BarScope` instance and its properties from 
  /// the context. Returns `null` if no `BarScope` is found in the widget tree.
  static BarScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<BarScope>();
  }

  /// Determines whether the widget tree should be rebuilt when the inherited widget changes.
  ///
  /// The [updateShouldNotify] method is called when the `BarScope` widget is rebuilt,
  /// and it decides whether the descendants should be rebuilt based on changes to 
  /// the `controller`, `theme`, or `mode` properties.
  @override
  bool updateShouldNotify(covariant BarScope oldWidget) {
    return oldWidget.controller != controller ||
        oldWidget.theme != theme ||
        oldWidget.mode != mode;
  }
}