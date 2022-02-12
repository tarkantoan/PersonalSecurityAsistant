import 'package:flutter/material.dart';

import 'app.controller.dart';
import 'app.view.dart';

class App {
  App() {
    final appController = AppController();
    widget = AppScreen(controller: appController);
  }
  late Widget widget;
}
