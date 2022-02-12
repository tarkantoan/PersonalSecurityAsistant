import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/cRouter.class.dart';

import '../core/sfw.class.dart';
import 'app.controller.dart';

class AppScreen extends SFW {
  AppScreen({Key? key, required controller})
      : super(key: key, controller: controller);

  AppController get getController => controller as AppController;

  @override
  initState() {
    cRouter.context = state.context;
  }

  @override
  Widget build() {
    return Scaffold(
      body: Container(
        width: controller.width,
        height: controller.height,
        child: const CircularProgressIndicator(),
        alignment: AlignmentDirectional.center,
      ),
    );
  }

  @override
  isBuilded() {
    state.setState(() {
      controller.width = MediaQuery.of(state.context).size.width;
      controller.height = MediaQuery.of(state.context).size.height;
    });
  }
}
