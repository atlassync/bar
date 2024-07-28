part of '../bar.dart';

class _BuildBarItem extends StatefulWidget {
  const _BuildBarItem(this.item);

  final BarItem item;

  @override
  State<_BuildBarItem> createState() => _BuildBarItemState();
}

class _BuildBarItemState extends State<_BuildBarItem> {
  late BarItemTheme _style;
  late BarController _controller;
  late bool _isSelected;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _style = widget.item.style ?? BarScope.of(context).theme.barItemStyle;
    _controller = BarScope.of(context).controller;
    _isSelected = _controller.index == widget.item.index;
    _controller.notifier.addListener(_updateSelection);
  }

  void _updateSelection() {
    setState(() {
      _isSelected = _controller.index == widget.item.index;
    });
  }

  @override
  void dispose() {
    _controller.notifier.removeListener(_updateSelection);
    super.dispose();
  }

  void onTap() {
    widget.item.onSelected?.call(widget.item.index);
    _controller.index = widget.item.index;
  }

  @override
  Widget build(BuildContext context) {
    //TODO: Implement BarItem build method.
    throw UnimplementedError();
  }
}
