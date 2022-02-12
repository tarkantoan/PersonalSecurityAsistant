import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';

class CarCrashAppBar extends SFW with PreferredSizeWidget {
  CarCrashAppBar({Key? key, required controller, required this.module})
      : super(key: key, controller: controller);
  CarCrashController module;

  CarCrashController get getController => controller as CarCrashController;

  @override
  initState() {}

  @override
  Widget build() {
    return AppBar(
      title: Text("Personal Securaty Assistans"),
    );
  }

  @override
  isBuilded() {}

  @override
  Size get preferredSize => Size.fromHeight(60);
}
