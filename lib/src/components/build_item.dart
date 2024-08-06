part of '../sidebar.dart';

class _BuildSideBarItem extends StatefulWidget {
  const _BuildSideBarItem(this.item);

  final SideBarItem item;

  @override
  State<_BuildSideBarItem> createState() => _BuildSideBarItemState();
}

class _BuildSideBarItemState extends State<_BuildSideBarItem> {
  late SideBarItemTheme _style;
  late SideBarController _controller;
  late bool _isSelected;
  bool _highlight = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _style = widget.item.style ?? SideBarScope.of(context).theme.barItemStyle;
    _controller = SideBarScope.of(context).controller;
    _isSelected = _controller.index == widget.item.index;
    _controller.notifier.addListener(_updateSelection);
  }

  void _updateSelection() {
    if (mounted) {
      setState(() {
        _isSelected = _controller.index == widget.item.index;
      });
    }
  }

  void _updateHighlight(bool value) {
    if (value == _highlight) return;
    if (mounted) {
      setState(() {
        _highlight = value;
      });
    }
  }

  @override
  void dispose() {
    _controller.notifier.removeListener(_updateSelection);
    super.dispose();
  }

  void onTap() {
    widget.item.onSelected?.call(widget.item.index);
    if (widget.item.navigate) {
      _controller.index = widget.item.index;
    }
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
          border: _determineBorder(),
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

    if (SideBarScope.of(context).mode != SideBarMode.expanded) return children;

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

  Border? _determineBorder() {
    if (!_style.showSelectedIndicator) return null;
    final side = BorderSide(
      width: _style.selectedIndicatorWidth,
      color: _isSelected ? _style.selectedIndicatorColor : Colors.transparent,
    );
    return Border(
      left: _style.indicatorAlign == SideBarIndicatorAlign.start
          ? side
          : BorderSide.none,
      right: _style.indicatorAlign == SideBarIndicatorAlign.end
          ? side
          : BorderSide.none,
    );
  }
}
