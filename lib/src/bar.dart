import 'package:bar/bar.dart';
import 'package:bar/src/scope.dart';
import 'package:flutter/material.dart';

part 'components/build_divider.dart';
part 'components/build_elements.dart';
part 'components/build_gap.dart';
part 'components/build_item.dart';

class Bar extends StatelessWidget {
  const Bar({
    super.key,
    required this.controller,
    this.header,
    required this.elements,
    this.footer,
    this.threshold = 600.0,
    this.mode = BarMode.auto,
    this.style,
  });

  final BarController controller;
  final Widget? header;
  final List<BarElement> elements;
  final Widget? footer;
  final double threshold;
  final BarMode mode;
  final BarTheme? style;

  static BarController of(BuildContext context) {
    return BarScope.of(context).controller;
  }

  static BarController? maybeOf(BuildContext context) {
    return BarScope.maybeOf(context)?.controller;
  }

  @override
  Widget build(BuildContext context) {
    return BarScope(
      controller: controller,
      theme:
          style ?? Theme.of(context).extension<BarTheme>() ?? const BarTheme(),
      mode: calculateMode(context),
      child: _Bar(
        header: header,
        elements: elements,
        footer: footer,
      ),
    );
  }

  BarMode calculateMode(BuildContext context) {
    if (mode != BarMode.auto) return mode;
    final availableSize = MediaQuery.of(context).size.width;
    final isCompact = availableSize < threshold;
    return isCompact ? BarMode.compact : BarMode.expanded;
  }
}

class _Bar extends StatefulWidget {
  const _Bar({
    this.header,
    required this.elements,
    this.footer,
  });

  final Widget? header;
  final List<BarElement> elements;
  final Widget? footer;

  @override
  State<_Bar> createState() => __BarState();
}

class __BarState extends State<_Bar> {
  late BarTheme _theme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _theme = BarScope.of(context).theme;
  }

  bool get _compact => BarScope.of(context).mode == BarMode.compact;

  List<BarElement> _indexElements(List<BarElement> elements, int counter) {
    return elements.map((element) {
      if (element is IndexableBarElement) {
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
          child: ListView(
            padding: _theme.padding,
            children: [
              if (widget.header != null) widget.header!,
              _BuildBarElements(_indexElements(widget.elements, 0)),
              if (widget.footer != null) widget.footer!,
            ],
          ),
        
      
    );
  }
}
