import 'package:bar/bar.dart';
import 'package:flutter/widgets.dart';

//?? Element
/// A `BarAdapter` class that implements the `BarElement` interface.
///
/// This class adapts a `Widget` child for use in a sidebar and provides a
/// concrete implementation of the `BarElement` interface.
@immutable
final class BarAdapter implements BarElement {
  /// The child widget that this adapter holds for the sidebar.
  final Widget child;


  /// Creates a `BarAdapter` with the given child widget for the sidebar.
  ///
  /// The [child] parameter is required and cannot be null.
  const BarAdapter(this.child);
}
