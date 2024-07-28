part of '../bar.dart';

class _BuildBarElements extends StatelessWidget {
  const _BuildBarElements(this.elements);

  final List<BarElement> elements;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: _children,
    );
  }

  List<Widget> get _children => elements.map<Widget>(
        (e) {
          if (e is BarItem) {
            return _BuildBarItem(e);
          } else if (e is ExpandableBarItem) {
            return _BuildExpandableBarItem(e);
          } else if (e is BarDivider) {
            return _BuildBarDivider(e);
          } else if (e is BarGap) {
            return _BuildBarGap(e);
          } else if (e is BarAdapter) {
            return e.child;
          } else {
            return const SizedBox.shrink();
          }
        },
      ).toList();
}
