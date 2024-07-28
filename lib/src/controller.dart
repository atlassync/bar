import 'package:flutter/widgets.dart';

/// A controller class that manages the selection state of a bar.
///
/// The `BarController` class uses a `ValueNotifier` to keep track of the
/// currently selected index in the bar. It provides methods to get and
/// set the selected index, which can be observed by widgets to react to
/// changes in selection.
class BarController {
  /// A [ValueNotifier] that holds the current selected index.
  ///
  /// Widgets can listen to this notifier to get updates when the selected
  /// index changes.
  final ValueNotifier<int> _notifier;

  /// Creates a [BarController] with an optional initial index.
  ///
  /// The [initialIndex] parameter defaults to `0` if not provided.
  BarController({int initialIndex = 0})
      : _notifier = ValueNotifier<int>(initialIndex);

  /// Gets the current selected index.
  ///
  /// This getter returns the value of the [_notifier].
  int get index => _notifier.value;

  /// Sets the selected index.
  ///
  /// This setter updates the value of the [_notifier] if the provided
  /// [index] is different from the current value.
  set index(int index) {
    if (index == _notifier.value) return;
    _notifier.value = index;
  }

  /// Gets the [ValueNotifier] instance.
  ///
  /// This getter returns the [_notifier], allowing widgets to listen to
  /// changes in the selected index.
  ValueNotifier<int> get notifier => _notifier;
}
