import 'package:flutter/foundation.dart';
import 'package:sidebar/sidebar.dart';

//?? Element
/// A class representing an empty element within a sidebar.
///
/// The `EmptySideBarElement` class is immutable and implements the `SideBarElement`
/// interface. It represents a type of sidebar element that contains no data or
/// functionality. This class can be used as a placeholder or default value in
/// scenarios where a `SideBarElement` is required but no meaningful element is available.
///
/// Since this class is marked as `@immutable` and `final`, instances of
/// `EmptySideBarElement` cannot be modified after they are created, ensuring
/// the integrity and immutability of the objects.
///
/// Example usage:
/// ```dart
/// final EmptySideBarElement emptyElement = EmptySideBarElement();
/// ```
@immutable
final class EmptySideBarElement implements SideBarElement {
  /// Creates an `EmptySideBarElement`.
  ///
  /// This constructor initializes an instance of `EmptySideBarElement`. 
  const EmptySideBarElement();
}
