part of '../bar.dart';

/// A widget that creates a styled divider.
///
/// The `_BuildBarDivider` class extends [StatelessWidget] and is used to
/// create a horizontal divider with a specified style. This divider can be
/// useful for visually separating content in a layout.
///
/// The style of the divider is determined by the [BarDivider] instance passed
/// to it. If the `style` property of the [BarDivider] is `null`, the widget
/// will use the default style provided by [BarScope.of(context).theme.barDividerStyle].
///
/// Example:
/// ```dart
/// _BuildBarDivider(BarDivider(
///   style: DividerStyle(thickness: 2.0, color: Colors.red),
/// ))
/// ```
/// In the above example, `_BuildBarDivider` will create a horizontal divider
/// with a thickness of 2.0 pixels and a red color.
class _BuildBarDivider extends StatelessWidget {
  /// Creates an instance of `_BuildBarDivider`.
  ///
  /// The [item] parameter is required and must not be null. It represents
  /// the [BarDivider] which defines the style of the divider.
  const _BuildBarDivider(this.item);

  /// The [BarDivider] instance that specifies the style of the divider.
  ///
  /// This field is final and must be initialized through the constructor.
  final BarDivider item;

  @override
  Widget build(BuildContext context) {
    // Retrieve the divider style from the item or use the default style.
    var style = item.style ?? BarScope.of(context).theme.barDividerStyle;
    
    return Divider(
      thickness: style.thickness,
      color: style.color,
      height: 0.0, // Divider height set to 0 to maintain its thickness only.
    );
  }
}
