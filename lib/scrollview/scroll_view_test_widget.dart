import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';

class ScrollViewTestWidget extends StatefulWidget {
  const ScrollViewTestWidget({key}) : super(key: key);

  @override
  State<ScrollViewTestWidget> createState() => _ScrollViewTestWidgetState();
}

class _ScrollViewTestWidgetState extends State<ScrollViewTestWidget> {
  @override
  Widget build(BuildContext context) {
    return refresh();
  }

  Widget refresh() {
    return EasyRefresh.builder(
      header: const MaterialHeader(),
      footer: const MaterialFooter(),
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 3));
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
    return NestedScrollView(
        physics: physics,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return headerBuilder(innerBoxIsScrolled);
        },
        body: buildList(physics));
  }

  List<Widget> headerBuilder(bool innerBoxIsScrolled) {
    List<Widget> list = [];

    list.add(SliverAppBar(
      title: const Text('嵌套ListView'),
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
        // Container(height: 300, color: Colors.orange),
        // Container(height: 300, color: Colors.pink),
        // Container(height: 300, color: Colors.red),
      ],
    )));

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
      child: Text("第 $index 行"),
    );
  }
}
