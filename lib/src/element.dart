/// The `BarElement` abstract interface class.
///
/// This interface defines a contract for elements that can be included
/// in a sidebar. It requires implementing classes to provide a concrete
/// implementation of the `shouldIndex` property, which indicates whether
/// the element should be indexed.
abstract interface class BarElement {}

/// An abstract interface class for indexable bar elements.
///
/// This interface extends `BarElement` and requires implementing classes
/// to provide a concrete implementation of the `index` property and the `copyWith` method.
abstract interface class IndexableBarElement implements BarElement {
  /// The index of the bar element.
  ///
  /// This property is used to order and identify elements within the sidebar.
  /// Implementing classes must provide a concrete implementation of this property.
  abstract final int index;
  /// Creates a copy of this element with the given fields replaced with new values.
  ///
  /// Implementing classes must provide a concrete implementation of this method.
  IndexableBarElement copyWith({int? index});
}
