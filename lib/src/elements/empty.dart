import 'package:bar/bar.dart';
import 'package:flutter/foundation.dart';

//?? Element
/// A class representing an empty element within a sidebar.
///
/// The [EmptyBarElement] class is immutable and implements the [BarElement]
/// interface, indicating that it represents a type of bar element that contains
/// no data or functionality. This class can be used as a placeholder or a
/// default value in scenarios where a [BarElement] is required but no
/// meaningful element is available.
///
/// Since this class is marked as `@immutable` and `final`, instances of
/// [EmptyBarElement] cannot be modified after they are created, ensuring
/// the integrity and immutability of the objects.
///
/// Example usage:
/// ```dart
/// final EmptyBarElement emptyElement = EmptyBarElement();
/// ```
@immutable
final class EmptyBarElement implements BarElement {
  const EmptyBarElement();
}
