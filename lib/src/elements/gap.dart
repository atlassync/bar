import 'package:flutter/foundation.dart';
import 'package:sidebar/sidebar.dart';

//?? Element
/// Represents a gap or space in a sidebar.
///
/// This class provides a concrete implementation of the `SideBarElement` interface
/// to create a gap with a specified size.
@immutable
final class SideBarGap implements SideBarElement {
  /// The size of the gap.
  ///
  /// This property defines the amount of space to be created as a gap in the sidebar.
  /// Defaults to `8.0`.
  final double gap;

  /// Creates a `SideBarGap` with the specified gap size.
  ///
  /// The `gap` parameter is required and cannot be `null`. If not provided, it defaults to `8.0`.
  const SideBarGap([this.gap = 8.0]);
}
