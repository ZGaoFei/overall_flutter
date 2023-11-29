import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overall_flutter/getx/controller.dart';

///
/// GetX 更新状态
///
class GetXTestWidget extends StatefulWidget {
  const GetXTestWidget({Key? key}) : super(key: key);

  @override
  State<GetXTestWidget> createState() => _GetXTestWidgetState();
}

class _GetXTestWidgetState extends State<GetXTestWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          ObxAndObsWidget(),
          ObxAndObsContentWidget(),
          GetViewWidget(),
          GetXWidget(),
          GetBuilderObsWidget(),
          SizedBox(height: 10),
          NoObsWidget(),
          GetBuilderWidget()
        ],
      ),
    );
  }
}

class ObxAndObsWidget extends StatelessWidget {
  const ObxAndObsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            controller.updateTitle("newTitle");
            controller.updateContent("newContent");
          },
          child: Container(
            width: 200,
            height: 60,
            color: Colors.lightGreen,
            alignment: AlignmentDirectional.center,
            child: const Text(
              "obx and obs change data",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        Obx(() {
          return Container(
            width: 200,
            height: 60,
            color: Colors.brown,
            alignment: AlignmentDirectional.center,
            child: Text(
              "title: ${controller.title.value} content: ${controller.content.value}",
              style: const TextStyle(fontSize: 14),
            ),
          );
        }),
      ],
    );
  }
}

class ObxAndObsContentWidget extends StatelessWidget {
  const ObxAndObsContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<Controller>();
    return Obx(() {
      return Container(
        width: 200,
        height: 60,
        color: Colors.white,
        alignment: AlignmentDirectional.center,
        child: Text(
          "title: ${controller.title.value} content: ${controller.content.value}",
          style: const TextStyle(fontSize: 14),
        ),
      );
    });
  }
}

class GetViewWidget extends GetView<Controller> {
  const GetViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: 200,
        height: 60,
        color: Colors.blueAccent,
        alignment: AlignmentDirectional.center,
        child: Text(
          "title: ${controller.title.value} content: ${controller.content.value}",
          style: const TextStyle(fontSize: 14),
        ),
      );
    });
  }
}

class GetXWidget extends StatelessWidget {
  const GetXWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      color: Colors.amberAccent,
      alignment: AlignmentDirectional.center,
      child: GetX<Controller>(
        builder: (controller) {
          return Text(
            "title: ${controller.title.value} content: ${controller.content.value}",
            style: const TextStyle(fontSize: 14),
          );
        },
      ),
    );
  }
}

class GetBuilderObsWidget extends StatelessWidget {
  const GetBuilderObsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      color: Colors.grey,
      alignment: AlignmentDirectional.center,
      child: GetX<Controller>(
        builder: (controller) {
          return Text(
            "title: ${controller.title.value} content: ${controller.content.value}",
            style: const TextStyle(fontSize: 14),
          );
        },
      ),
    );
  }
}

class NoObsWidget extends StatelessWidget {
  const NoObsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(Controller());
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            controller.updateSubTitle("newSubTitle");
            controller.updateSubContent("newSubContent");
          },
          child: Container(
            width: 200,
            height: 60,
            color: Colors.brown,
            alignment: AlignmentDirectional.center,
            child: const Text(
              "no obx and no obs change data",
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        Container(
          width: 200,
          height: 60,
          color: Colors.lightGreen,
          alignment: AlignmentDirectional.center,
          child: Text(
            "subTitle: ${controller.subTitle} subContent: ${controller.subContent}",
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class GetBuilderWidget extends StatelessWidget {
  const GetBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 60,
      color: Colors.amberAccent,
      alignment: AlignmentDirectional.center,
      child: GetBuilder<Controller>(
        builder: (controller) {
          return Text(
            "subTitle: ${controller.subTitle} subContent: ${controller.subContent}",
            style: const TextStyle(fontSize: 14),
          );
        },
      ),
    );
  }
}
