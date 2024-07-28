part of '../bar.dart';

class _BuildBarGap extends StatelessWidget {
  const _BuildBarGap(this.item);

  final BarGap item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: item.gap,
      width: double.maxFinite,
    );
  }
}
