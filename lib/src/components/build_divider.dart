part of '../sidebar.dart';

class _BuildSideBarDivider extends StatelessWidget {
  const _BuildSideBarDivider(this.item);

  final SideBarDivider item;

  @override
  Widget build(BuildContext context) {
    var style = item.style ?? SideBarScope.of(context).theme.barDividerStyle;
    return Divider(
      thickness: style.thickness,
      color: style.color,
      height: 0.0,
    );
  }
}
