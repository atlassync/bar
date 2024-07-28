part of '../bar.dart';

class _BuildBarDivider extends StatelessWidget {
  const _BuildBarDivider(this.item);

  final BarDivider item;

  @override
  Widget build(BuildContext context) {
    var style = item.style ?? BarScope.of(context).theme.barDividerStyle;
    return Divider(
      thickness: style.thickness,
      color: style.color,
      height: 0.0,
    );
  }
}
