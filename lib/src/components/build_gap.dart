part of '../bar.dart';

/// A widget that creates a gap with a specified height.
///
/// The `_BuildBarGap` class extends [StatelessWidget] and is used to create
/// a vertical space of a given height. This can be useful in layouts where
/// a specific amount of vertical spacing is needed.
///
/// The height of the gap is determined by the [BarGap] instance passed to it.
/// The width of the gap is set to `double.maxFinite`, which effectively
/// makes it span the full width of its parent container.
///
/// Example:
/// ```dart
/// _BuildBarGap(BarGap(gap: 20.0))
/// ```
/// In the above example, `_BuildBarGap` will create a gap of 20.0 pixels
/// in height.
class _BuildBarGap extends StatelessWidget {
  /// Creates an instance of `_BuildBarGap`.
  ///
  /// The [item] parameter is required and must not be null. It represents
  /// the [BarGap] which defines the height of the gap.
  const _BuildBarGap(this.item);

  /// The [BarGap] instance that specifies the gap's height.
  ///
  /// This field is final and must be initialized through the constructor.
  final BarGap item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: item.gap,
      width: double.maxFinite,
    );
  }
}
