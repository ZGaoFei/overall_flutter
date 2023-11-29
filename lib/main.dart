import 'package:flutter/material.dart';
import 'package:overall_flutter/getx/getx_test.dart';
import 'package:overall_flutter/provider/provider_test.dart';

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
        "getx_test": (context) => const GetXTestWidget()
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
  Widget build(BuildContext context) {
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
          ],
        ),
      ),
    );
  }
}
