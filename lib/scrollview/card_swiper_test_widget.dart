import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiperTestWidget extends StatefulWidget {
  const CardSwiperTestWidget({key}) : super(key: key);

  @override
  State<CardSwiperTestWidget> createState() => _CardSwiperTestWidgetState();
}

class _CardSwiperTestWidgetState extends State<CardSwiperTestWidget> {

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

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      height: 149,
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
        onIndexChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        transformer: ScaleTransformer(scale: 0.88),
      ),
    );
  }

  Widget _builtItem(int index) {
    double left = currentIndex == index ? 7 : 6;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(left: left, right: left),
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child:
      Text("第$index个", style: TextStyle(fontSize: 14, color: Colors.white)),
    );
  }
}

class ScaleTransformer extends PageTransformer {
  final double? _scale;

  ScaleTransformer({double? scale = 0.8})
      : _scale = scale;

  @override
  Widget transform(Widget child, TransformInfo info) {
    final position = info.position;
    print("========position======== $position");
    var c = child;
    if (_scale != null) {
      double s = 1;
      if (position!.abs() < 0.01) {
        s = 1;
      } else {
        s = _scale!;
      }
      print("========scale===00000000===== ${s}");

      c = Transform.scale(
        scale: s,
        child: c,
      );
    }

    return c;
  }
}