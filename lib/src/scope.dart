import 'package:flutter/widgets.dart';
import 'package:sidebar/sidebar.dart';

/// A widget that provides access to the `SideBarController`, `SideBarTheme`, and `SideBarMode`
/// for its descendants.
///
/// The `SideBarScope` class extends `InheritedWidget` and facilitates passing the `SideBarController`,
/// `SideBarTheme`, and `SideBarMode` down the widget tree. This allows descendant widgets to access
/// these properties without having to explicitly pass them through constructors.
class SideBarScope extends InheritedWidget {
  /// The controller that manages the state and behavior of the sidebar.
  final SideBarController controller;

  /// The theme that defines the visual styling of the sidebar.
  final SideBarTheme theme;

  /// The mode that determines the layout and behavior of the sidebar.
  final SideBarMode mode;

  /// Creates a `SideBarScope` widget.
  ///
  /// The [controller], [theme], [mode], and [child] parameters are required.
  const SideBarScope({
    super.key,
    required this.controller,
    required this.theme,
    required this.mode,
    required super.child,
  });

  /// Retrieves the nearest `SideBarScope` instance up the widget tree.
  ///
  /// This method is used to access the `SideBarScope` instance and its properties from 
  /// the given [context]. It returns the `SideBarScope` instance if found, otherwise throws an error.
  static SideBarScope of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SideBarScope>()!;
  }

  /// Retrieves the nearest `SideBarScope` instance up the widget tree, if it exists.
  ///
  /// This method is used to access the `SideBarScope` instance and its properties from 
  /// the given [context]. It returns `null` if no `SideBarScope` is found in the widget tree.
  static SideBarScope? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SideBarScope>();
  }

  /// Determines whether the widget tree should be rebuilt when the inherited widget changes.
  ///
  /// The [updateShouldNotify] method is called when the `SideBarScope` widget is rebuilt,
  /// and it decides whether the descendants should be rebuilt based on changes to 
  /// the `controller`, `theme`, or `mode` properties.
  @override
  bool updateShouldNotify(covariant SideBarScope oldWidget) {
    return oldWidget.controller != controller ||
        oldWidget.theme != theme ||
        oldWidget.mode != mode;
  }
}