import 'package:flutter/material.dart';
import 'package:overall_flutter/provider/data.dart';

class Model with ChangeNotifier {
  Data data = Data();

  setData(int id, String name) {
    data.id = id;
    data.name = name;

    notifyListeners();
  }
}