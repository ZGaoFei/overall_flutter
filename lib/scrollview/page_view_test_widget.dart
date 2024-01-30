import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class PageViewTestWidget extends StatefulWidget {
  const PageViewTestWidget({key}) : super(key: key);

  @override
  State<PageViewTestWidget> createState() => _PageViewTestWidgetState();
}

class _PageViewTestWidgetState extends State<PageViewTestWidget> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildContent(),
      ],
    );
  }

  Widget _buildPageView() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          controller: PageController(),
          physics: const PageScrollPhysics(),
          itemBuilder: (context, index) {
            return _builtItem(index);
          }),
    );
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      height: 150,
      child: Swiper(
        physics: AlwaysScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return _builtItem(index);
        },
        itemCount: 30,
        autoplay: true,
        duration: 1000,
        autoplayDelay: 3000,
        viewportFraction: 0.25,
        // scale: 0.8,
        onTap: (index) {},
        itemWidth: 150,
        itemHeight: 150,
        onIndexChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
          layout: SwiperLayout.DEFAULT,
        //   customLayoutOption:
        //   CustomLayoutOption(startIndex: 0, stateCount: 5)
        //     // ..addScale([
        //     //   0.6,
        //     //   0.8,
        //     //   1.0,
        //     //   0.8,
        //     //   0.6,
        //     // ], Alignment.center)
        //     // ..addOpacity([
        //     //   1.0,
        //     //   1.0,
        //     //   1.0,
        //     //   1.0,
        //     //   1.0,
        //     // ])
        //     ..addTranslate([
        //       Offset(-180.0, 0),
        //       Offset(-80.0, 0),
        //       Offset(0.0, 0.0),
        //       Offset(80.0, 0),
        //       Offset(180.0, 0),
        //     ])
        // ,
      ),
    );
  }

  Widget _builtItem(int index) {
    double margin = currentIndex == index ? 0 : 10;
    double left = currentIndex == index ? 4 : 10;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: margin, bottom: margin, left: left, right: left),
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child:
          Text("第$index个", style: TextStyle(fontSize: 14, color: Colors.white)),
    );
  }
}
