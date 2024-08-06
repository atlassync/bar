import 'package:flutter/widgets.dart';

/// A controller class that manages the selection state of a sidebar.
///
/// The `SideBarController` class uses a `ValueNotifier` to track the
/// currently selected index within the sidebar. It provides mechanisms
/// for retrieving and updating the selected index, which can be observed
/// by widgets to respond to changes in selection.
///
/// Example usage:
/// ```dart
/// final controller = SideBarController(initialIndex: 1);
/// controller.index = 2; // Updates the selected index
/// print(controller.index); // Prints the current selected index
/// ```
class SideBarController {
  /// A [ValueNotifier] that holds the current selected index.
  ///
  /// Widgets can listen to this notifier to receive updates when the
  /// selected index changes.
  final ValueNotifier<int> _notifier;

  /// Creates a [SideBarController] with an optional initial index.
  ///
  /// The [initialIndex] parameter sets the initial selected index. If not
  /// provided, it defaults to `0`.
  SideBarController({int initialIndex = 0})
      : _notifier = ValueNotifier<int>(initialIndex);

  /// Gets the current selected index.
  ///
  /// This getter returns the value of the `_notifier`, representing the
  /// current selected index within the sidebar.
  int get index => _notifier.value;

  /// Sets the selected index.
  ///
  /// This setter updates the value of the `_notifier` if the provided
  /// [index] differs from the current value. It ensures that the selected
  /// index is updated only when necessary.
  set index(int index) {
    if (index == _notifier.value) return;
    _notifier.value = index;
  }

  /// Gets the [ValueNotifier] instance.
  ///
  /// This getter provides access to the `_notifier`, allowing widgets
  /// to listen for and react to changes in the selected index.
  ValueNotifier<int> get notifier => _notifier;
}