import 'package:flutter/material.dart';

class CustomScrollViewTestWidget extends StatefulWidget {
  const CustomScrollViewTestWidget({key}) : super(key: key);

  @override
  State<CustomScrollViewTestWidget> createState() => _CustomScrollViewTestWidgetState();
}

class _CustomScrollViewTestWidgetState extends State<CustomScrollViewTestWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: ScrollController(),
      slivers: [
        SliverAppBar(
          title: Text('嵌套ListView'),
          pinned: true, // 固定在顶部
        ),
        SliverToBoxAdapter(
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
            )),
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyTabBarDelegate(
            child: Container(color: Colors.red),
            // globalKey: globalKey,
          )
        ),
        // SliverFillRemaining(
        //   child: buildList(),
        // ),
        // buildList(),
        // buildSliverList()
        buildListView()
      ],
    );
  }

  Widget buildListView() {
    return SliverFillRemaining(
      child: PrimaryScrollController(
        controller: ScrollController(),
        child: buildList(),
      ),
    );
    // return SliverFillRemaining(child: buildList());
  }

  Widget buildSliverList() {
    return SliverList(delegate: SliverChildBuilderDelegate((context, index) {
      return _buildItem(index);
    }, childCount: 30));
  }

  Widget buildList() {
    return ListView.builder(
        itemCount: 40,
        physics: const ClampingScrollPhysics(), //重要
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

  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}