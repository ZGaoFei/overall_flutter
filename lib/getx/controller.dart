import 'package:get/get.dart';

class Controller extends GetxController {
  final title = "title".obs;
  final content = "content".obs;
  var subTitle = "subTitle";
  var subContent = "subContent";

  updateTitle(String newTitle) {
    title(newTitle);
  }

  updateContent(String newContent) {
    content(newContent);
  }

  updateSubTitle(String newSubTitle) {
    subTitle = newSubTitle;
    update();
  }

  updateSubContent(String newSubContent) {
    subContent = newSubContent;
    update();
  }
}