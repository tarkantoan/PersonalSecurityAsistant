import 'package:flutter/material.dart';

class SFWRouter with ChangeNotifier {
  List<Widget> activeRoutes = [];

  addRoute(Widget widget) {
    activeRoutes.add(widget);
    notifyListeners();
  }

  back() {
    activeRoutes.removeLast();
    notifyListeners();
  }

  reset() {
    if (activeRoutes.isNotEmpty) {
      activeRoutes = [activeRoutes.first];
    } else {
      activeRoutes = [];
    }
    notifyListeners();
  }

  Widget? getActive() {
    return activeRoutes.isNotEmpty ? activeRoutes.last : null;
  }
}
