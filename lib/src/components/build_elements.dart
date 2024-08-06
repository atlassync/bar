part of '../sidebar.dart';

class _BuildSideBarElements extends StatelessWidget {
  const _BuildSideBarElements(this.elements);

  final List<SideBarElement> elements;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _children.map((e) => Flexible(child: (e))).toList(),
    );
  }

  List<Widget> get _children => elements.map<Widget>(
        (e) {
          if (e is SideBarItem) {
            return _BuildSideBarItem(e);
          } else if (e is SideBarDivider) {
            return _BuildSideBarDivider(e);
          } else if (e is SideBarGap) {
            return _BuildSideBarGap(e);
          } else if (e is SideBarAdapter) {
            return e.child;
          } else {
            return const SizedBox.shrink();
          }
        },
      ).toList();
}
