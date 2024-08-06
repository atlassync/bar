/// The `SideBarElement` abstract interface class.
///
/// This interface defines a contract for elements that can be included
/// in a sidebar. Implementing classes are expected to adhere to this 
/// contract, which may involve providing specific properties or methods
/// depending on the element's functionality.
abstract interface class SideBarElement {}

/// An abstract interface class for indexable sidebar elements.
///
/// This interface extends `SideBarElement` and adds requirements for elements
/// that need to be ordered or identified within the sidebar. Implementing classes
/// must provide a concrete implementation of the `index` property and the `copyWith`
/// method to create modified copies of the element.
///
/// The `index` property is used to specify the position or identifier of the element.
/// The `copyWith` method allows creating a new instance of the element with updated
/// index or other properties.
///
/// Implementing classes must provide specific implementations for these requirements.
abstract interface class IndexableSideBarElement implements SideBarElement {
  /// The index of the sidebar element.
  ///
  /// This property specifies the order or identifier of the element within the sidebar.
  /// It is a required property for indexable elements and must be implemented by
  /// the implementing class.
  abstract final int index;

  /// Creates a copy of this element with the specified fields replaced with new values.
  ///
  /// The `copyWith` method allows for creating a new instance of the element with
  /// updated properties, while preserving the original instance's values for any
  /// parameters that are not specified.
  ///
  /// Implementing classes must provide a concrete implementation of this method
  /// to ensure that elements can be duplicated and modified as needed.
  IndexableSideBarElement copyWith({int? index});
}
