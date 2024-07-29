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
  bool _highlight = false;

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

  void _updateHighlight(bool value) {
    if (value == _highlight) return;
    setState(() {
      _highlight = value;
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
    return Padding(
      padding: _style.margin,
      child: InkWell(
        borderRadius: _style.borderRadius.resolve(null),
        onTap: onTap,
        onHover: _updateHighlight,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return ClipRRect(
      borderRadius: _style.borderRadius,
      child: Container(
        padding: _style.padding,
        decoration: BoxDecoration(
          color: _determineBackgroundColor(),
          border: _style.showSelectedIndicator ? Border(
            left: BorderSide(
              width: _style.selectedIndicatorWidth,
              color: _isSelected
                  ? _style.selectedIndicatorColor
                  : Colors.transparent,
            ),
          ) : null,
        ),
        child: Row(
          children: _buildElements(),
        ),
      ),
    );
  }

  List<Widget> _buildElements() {
    List<Widget> children = [];
    if (widget.item.leading != null) {
      children.add(_buildLeading());
    }

    if (BarScope.of(context).mode != BarMode.expanded) return children;

    if (widget.item.title != null) {
      children.add(SizedBox(width: _style.gap));
      children.add(_buildTitle());
    }

    if (widget.item.trailing != null) {
      children.add(SizedBox(width: _style.gap));
      children.add(const Spacer());
      children.add(_buildTrailing());
    }

    return children;
  }

  Widget _buildLeading() {
    return Flexible(
      child: widget.item.leading!(_isSelected),
    );
  }

  Widget _buildTitle() {
    return Expanded(
      flex: 4,
      child: Text(
        widget.item.title!(_isSelected),
        style: _isSelected ? _style.selectedTitleStyle : _style.titleStyle,
      ),
    );
  }

  Widget _buildTrailing() {
    return Flexible(
      child: widget.item.trailing!(_isSelected),
    );
  }

  Color? _determineBackgroundColor() {
    if (_isSelected) {
      return _style.selectedBackgroundColor;
    } else if (_highlight) {
      return _style.hoverBackgroundColor;
    } else {
      return _style.backgroundColor;
    }
  }
}
