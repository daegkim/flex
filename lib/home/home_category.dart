import 'package:flutter/material.dart';

class HomeCategoryWidget extends StatelessWidget {
  final List<String> _categories;
  const HomeCategoryWidget({Key? key, required List<String> categories}) : _categories = categories, super(key: key);

  @override
  Widget build(BuildContext context) {
    Key forwardListKey = UniqueKey();
    Widget forwardList = SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Text(_categories[index % _categories.length]),
        );
      }),
      key: forwardListKey,
    );
    Widget reverseList = SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Text(_categories[_categories.length - 1 - (index % _categories.length)]),
        );
      }),
    );
    return SizedBox(
      child: Scrollable(
        axisDirection: AxisDirection.right,
        viewportBuilder: (context, offset) {
          return Viewport(
            axisDirection: AxisDirection.right,
            offset: offset,
            center: forwardListKey,
            slivers: [
              reverseList,
              forwardList,
            ],
          );
        },
      ),
      height: 60,
    );
  }
}