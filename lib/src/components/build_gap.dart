part of '../sidebar.dart';

class _BuildSideBarGap extends StatelessWidget {
  const _BuildSideBarGap(this.item);

  final SideBarGap item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: item.gap,
      width: double.maxFinite,
    );
  }
}
