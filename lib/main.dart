import 'package:flutter/material.dart';
import 'package:overall_flutter/getx/getx_test.dart';
import 'package:overall_flutter/provider/provider_test.dart';
import 'package:overall_flutter/scrollview/card_swiper_test_widget.dart';
import 'package:overall_flutter/scrollview/custom_scroll_view_test_widget.dart';
import 'package:overall_flutter/scrollview/extended_nested_scroll_view_widget.dart';
import 'package:overall_flutter/scrollview/page_view_test_widget.dart';
import 'package:overall_flutter/scrollview/scroll_view_test_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "provider_test": (context) => const ProviderTestWidget(),
        "getx_test": (context) => const GetXTestWidget(),
        "scroll_view_test": (context) => const ScrollViewTestWidget(),
        "custom_scroll_view_test": (context) => const CustomScrollViewTestWidget(),
        "extended_nested_scroll_view_test": (context) => const ExtendedNestedScrollViewWidget(),
        "page_view_test": (context) => const PageViewTestWidget(),
        "card_swiper_test": (context) => const CardSwiperTestWidget(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    String priceStr = "10.00";
    while(priceStr.endsWith("0")) {
      priceStr = priceStr.substring(0, priceStr.length - 1);
    }
    if (priceStr.endsWith(".")) {
      priceStr = priceStr.substring(0, priceStr.length - 1);
    }
    print("========priceStr========= $priceStr");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("provider_test");
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.red,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'provider test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("getx_test");
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.green,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'getx test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("scroll_view_test");
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.yellow,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'scroll view test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("custom_scroll_view_test");
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.red,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'custom scroll view test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("extended_nested_scroll_view_test");
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.black,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'extended nested scroll view test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("page_view_test");
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.amber,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'page view test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("card_swiper_test");
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.black26,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'page view test',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                _test();
              },
              child: Container(
                width: 100,
                height: 70,
                color: Colors.black26,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'test list insert',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _test() {
    print("==========element===000==== ");
    // List list = List.filled(10, 1);
    List<int> list = List.generate(5, (_) => 0);
    // List list = [0, 0, 0, 0, 0];
    list[2] = 2;
    list[1] = 1;
    list[3] = 3;
    list[0] = 0;
    list[4] = 4;
    for (var element in list) {
      print("==========element======= $element");
    }
  }
}
