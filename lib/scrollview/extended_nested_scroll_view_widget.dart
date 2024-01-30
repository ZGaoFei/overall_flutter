import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:easy_refresh/easy_refresh.dart';

class ExtendedNestedScrollViewWidget extends StatefulWidget {
  const ExtendedNestedScrollViewWidget({key}) : super(key: key);

  @override
  State<ExtendedNestedScrollViewWidget> createState() => _ExtendedScrollViewWidgetState();
}

class _ExtendedScrollViewWidgetState extends State<ExtendedNestedScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    // return ExtendedNestedScrollView(
    //     headerSliverBuilder: (context, innerBoxIsScrolled) {
    //       return headerBuilder(innerBoxIsScrolled);
    //     },
    //     body: buildList());
    return refresh();
  }

  Widget refresh() {
    return EasyRefresh.builder(
      header: BezierCircleHeader(),
      onRefresh: () async {
        await Future.delayed(Duration(seconds: 3));
      },
      onLoad: () async {
        return IndicatorResult.noMore;
      },
      childBuilder: (context, physics) {
        return buildScrollView(physics);
      },
    );
  }

  Widget buildScrollView(ScrollPhysics physics) {
    return ExtendedNestedScrollView(
      physics: physics,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return headerBuilder(innerBoxIsScrolled);
        },
        body: buildList(physics));
  }

  List<Widget> headerBuilder(bool innerBoxIsScrolled) {
    List<Widget> list = [];

    list.add(SliverAppBar(
      title: const Text('嵌套ListView0000'),
      pinned: true, // 固定在顶部
      forceElevated: innerBoxIsScrolled,
    ));

    list.add(SliverToBoxAdapter(
        child: Column(
          children: [
            Container(height: 300, color: Colors.amber),
            Container(height: 300, color: Colors.blue),
            Container(height: 300, color: Colors.cyan),
            Container(height: 300, color: Colors.deepOrangeAccent),
            Container(height: 300, color: Colors.white),
            Container(height: 300, color: Colors.green),
            Container(height: 300, color: Colors.lightGreen),
            Container(height: 300, color: Colors.brown),
            Container(height: 300, color: Colors.orange),
            Container(height: 300, color: Colors.pink),
            Container(height: 300, color: Colors.red),
          ],
        )));

    list.add(SliverPersistentHeader(
        pinned: true,
        delegate: StickyTabBarDelegate(
          child: Container(color: Colors.red),
          // globalKey: globalKey,
        )
    ));

    return list;
  }

  Widget buildList(ScrollPhysics physics) {
    return ListView.builder(
        itemCount: 30,
        physics: physics, //重要
        itemBuilder: (context, index) {
          return _buildItem(index);
        });
  }

  Widget _buildItem(int index) {
    return Container(
      height: 40,
      child: Text("第 $index 行", style: TextStyle(fontSize: 14)),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  Widget child;
  // GlobalKey globalKey;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.transparent,
      child: this.child,
    );
  }

  @override

  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
