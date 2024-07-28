import 'package:bar/bar.dart';
import 'package:flutter/foundation.dart';

//?? Element
/// A `BarGap` class that implements the `BarElement` interface.
///
/// This class represents a gap or space in a sidebar. It provides a concrete 
/// implementation of the `BarElement` interface.
@immutable
final class BarGap implements BarElement {
  /// The size of the gap.
  ///
  /// This property specifies the amount of space to be created as a gap in the sidebar.
  /// defaults to 8.0.
  final double gap;

  /// Creates a `BarGap` with the specified gap size.
  ///
  /// The `gap` parameter is required and cannot be null.
  const BarGap([this.gap = 8.0]);
}
