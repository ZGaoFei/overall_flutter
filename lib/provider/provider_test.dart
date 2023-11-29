import 'package:flutter/material.dart';
import 'package:overall_flutter/provider/model.dart';
import 'package:provider/provider.dart';

///
/// Provider 更新状态
///
class ProviderTestWidget extends StatefulWidget {
  const ProviderTestWidget({Key? key}) : super(key: key);

  @override
  State<ProviderTestWidget> createState() => _ProviderTestWidgetState();
}

class _ProviderTestWidgetState extends State<ProviderTestWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // provider外面的widget不能使用provider
          // Container(
          //     width: 100,
          //     height: 100,
          //     color: Colors.white,
          //     alignment: AlignmentDirectional.center,
          //     child: Text(
          //       "out widget...name: ${context.watch<Model>().data.name} ID：${context.watch<Model>().data.id}",
          //       style: const TextStyle(fontSize: 13),
          //     )),
          const Text(
            "==========ChangeNotifierProvider==========",
            style: TextStyle(fontSize: 15),
          ),
          ChangeNotifierProvider<Model>(
            create: (context) => Model(),
            child: Column(
              children: const [
                ChangeWidget(),
                ChangeWidget2(),
                ContentWidget(),
              ],
            ),
          ),
          const Text(
            "==========MultiProvider==========",
            style: TextStyle(fontSize: 15),
          ),
          MultiProvider(
            providers: [ChangeNotifierProvider(create: (context) => Model())],
            child: Column(
              children: const [
                ChangeWidget(),
                ChangeWidget2(),
                ContentWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// 使用Consumer
class ChangeWidget extends StatefulWidget {
  const ChangeWidget({Key? key}) : super(key: key);

  @override
  State<ChangeWidget> createState() => _ChangeWidgetState();
}

class _ChangeWidgetState extends State<ChangeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Model>(
      builder: (context, model, child) {
        return Column(
          children: [
            Text(
              "name: ${model.data.name} ID：${model.data.id}",
              style: const TextStyle(fontSize: 13),
            ),
            GestureDetector(
                onTap: () {
                  model.setData(1000, "hello world!");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                  alignment: AlignmentDirectional.center,
                  child: const Text(
                    "change",
                    style: TextStyle(fontSize: 16),
                  ),
                )),
          ],
        );
      },
    );
  }
}

// 使用context.read()
class ChangeWidget2 extends StatelessWidget {
  const ChangeWidget2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<Model>(context, listen: false).data;
    return Column(
      children: [
        Text(
          "name: ${context.watch<Model>().data.name} ID：${context.watch<Model>().data.id}",
          style: const TextStyle(fontSize: 13),
        ),
        GestureDetector(
            onTap: () {
              context.read<Model>().setData(1000, "hello world222");
              // 使用watch不会刷新
              // context.watch<Model>().setData(1000, "hello world222");
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amber,
              alignment: AlignmentDirectional.center,
              child: const Text(
                "change2",
                style: TextStyle(fontSize: 16),
              ),
            )),
      ],
    );
  }
}

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100,
        height: 100,
        color: Colors.white,
        alignment: AlignmentDirectional.center,
        child: Text(
          "name: ${context.watch<Model>().data.name} ID：${context.watch<Model>().data.id}",
          style: const TextStyle(fontSize: 13),
        ));
  }
}
