import 'package:flutter/material.dart';
import 'package:sidebar/sidebar.dart';
import 'package:sidebar/src/scope.dart';

part 'components/build_divider.dart';
part 'components/build_elements.dart';
part 'components/build_gap.dart';
part 'components/build_item.dart';

/// A widget that represents a sidebar with customizable content and appearance.
///
/// The `SideBar` class is a stateless widget that provides a sidebar UI component
/// with support for a header, a list of elements, and a footer. It uses a `SideBarController`
/// to manage the selection state and a `SideBarTheme` for styling. The sidebar can
/// switch between different modes (`auto`, `compact`, `expanded`) based on the screen size
/// or a specified mode.
///
/// Example usage:
/// ```dart
/// final controller = SideBarController();
/// SideBar(
///   controller: controller,
///   header: Text('Header'),
///   elements: [/* list of sidebar elements */],
///   footer: Text('Footer'),
///   threshold: 500.0,
///   mode: SideBarMode.auto,
///   style: SideBarTheme(
///     backgroundColor: Colors.blue,
///     expandedWidth: 250.0,
///     compactWidth: 70.0,
///   ),
/// );
/// ```
class SideBar extends StatelessWidget {
  /// Creates a `SideBar` widget.
  ///
  /// The [controller] is required and manages the selection state of the sidebar.
  /// The [elements] parameter is required and specifies the list of elements to be
  /// displayed in the sidebar. Other parameters are optional:
  /// - [header] specifies an optional header widget.
  /// - [footer] specifies an optional footer widget.
  /// - [threshold] defines the width threshold for switching between compact and expanded modes.
  /// - [mode] sets the mode of the sidebar, which can be auto, compact, or expanded.
  /// - [style] allows for custom styling via `SideBarTheme`.
  const SideBar({
    super.key,
    required this.controller,
    this.header,
    required this.elements,
    this.footer,
    this.threshold = 600.0,
    this.mode = SideBarMode.auto,
    this.style,
  });

  /// The controller that manages the state and behavior of the sidebar.
  final SideBarController controller;

  /// An optional header widget displayed at the top of the sidebar.
  final Widget? header;

  /// The list of elements to be displayed in the sidebar.
  final List<SideBarElement> elements;

  /// An optional footer widget displayed at the bottom of the sidebar.
  final Widget? footer;

  /// The width threshold for switching between compact and expanded modes.
  ///
  /// If the screen width is below this threshold, the sidebar switches to compact mode.
  final double threshold;

  /// The mode that determines the layout and behavior of the sidebar.
  ///
  /// Can be `SideBarMode.auto`, `SideBarMode.compact`, or `SideBarMode.expanded`.
  final SideBarMode mode;

  /// Optional styling for the sidebar via `SideBarTheme`.
  final SideBarTheme? style;

  /// Retrieves the `SideBarController` from the nearest `SideBarScope` ancestor in the widget tree.
  ///
  /// Throws an error if no `SideBarScope` is found in the widget tree.
  static SideBarController of(BuildContext context) {
    return SideBarScope.of(context).controller;
  }

  /// Retrieves the `SideBarController` from the nearest `SideBarScope` ancestor in the widget tree, if it exists.
  ///
  /// Returns `null` if no `SideBarScope` is found in the widget tree.
  static SideBarController? maybeOf(BuildContext context) {
    return SideBarScope.maybeOf(context)?.controller;
  }

  @override
  Widget build(BuildContext context) {
    return SideBarScope(
      controller: controller,
      theme: style ??
          Theme.of(context).extension<SideBarTheme>() ??
          const SideBarTheme(),
      mode: calculateMode(context),
      child: _SideBar(
        header: header,
        elements: elements,
        footer: footer,
      ),
    );
  }

  /// Determines the mode of the sidebar based on the screen size and the specified mode.
  ///
  /// If the mode is set to `SideBarMode.auto`, the mode is calculated based on the screen width
  /// relative to the [threshold]. If the width is below the threshold, it returns `SideBarMode.compact`,
  /// otherwise it returns `SideBarMode.expanded`.
  SideBarMode calculateMode(BuildContext context) {
    if (mode != SideBarMode.auto) return mode;
    final availableSize = MediaQuery.of(context).size.width;
    final isCompact = availableSize < threshold;
    return isCompact ? SideBarMode.compact : SideBarMode.expanded;
  }
}

/// A private stateful widget that builds the sidebar UI.
///
/// The `_SideBar` class is used internally by the `SideBar` widget to construct the
/// sidebar's appearance based on its current mode and theme. It handles the layout
/// and rendering of the sidebar's elements, header, and footer.
///
/// This class is not intended to be used directly outside of the `SideBar` widget.
class _SideBar extends StatefulWidget {
  /// Creates a `_SideBar` widget.
  ///
  /// The [elements] parameter is required and specifies the list of elements to be
  /// displayed in the sidebar. The [header] and [footer] parameters are optional.
  const _SideBar({
    this.header,
    required this.elements,
    this.footer,
  });

  /// An optional header widget displayed at the top of the sidebar.
  final Widget? header;

  /// The list of elements to be displayed in the sidebar.
  final List<SideBarElement> elements;

  /// An optional footer widget displayed at the bottom of the sidebar.
  final Widget? footer;

  @override
  State<_SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<_SideBar> {
  late SideBarTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = SideBarScope.of(context).theme;
  }

  bool get _compact => SideBarScope.of(context).mode == SideBarMode.compact;

  /// Indexes elements with sequential indices if they are `IndexableSideBarElement`.
  ///
  /// This method maps over the given list of elements and assigns an index to each
  /// element that implements `IndexableSideBarElement`. It returns a new list with
  /// indexed elements.
  List<SideBarElement> _indexElements(
      List<SideBarElement> elements, int counter) {
    return elements.map((element) {
      if (element is IndexableSideBarElement) {
        element = element.copyWith(index: counter++);
      }
      return element;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _compact ? _theme.compactWidth : _theme.expandedWidth,
      decoration: BoxDecoration(
        color: _theme.backgroundColor,
        border: _theme.border,
        borderRadius: _theme.borderRadius,
      ),
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView(
          padding: _theme.padding,
          children: [
            if (widget.header != null) widget.header!,
            _BuildSideBarElements(_indexElements(widget.elements, 0)),
            if (widget.footer != null) widget.footer!,
          ],
        ),
      ),
    );
  }
}
