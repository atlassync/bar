import 'package:flutter/widgets.dart';
import 'package:sidebar/sidebar.dart';

//?? Element
/// Adapts a `Widget` child for use in a sidebar.
///
/// The `SideBarAdapter` class implements the `SideBarElement` interface and
/// provides a way to include a widget as a sidebar element.
@immutable
final class SideBarAdapter implements SideBarElement {
  /// The child widget that this adapter holds.
  ///
  /// This widget is incorporated into the sidebar. It is a required parameter and cannot be `null`.
  final Widget child;

  /// Creates a `SideBarAdapter` with the given child widget.
  ///
  /// The [child] parameter is required and cannot be `null`.
  const SideBarAdapter(this.child);
}
