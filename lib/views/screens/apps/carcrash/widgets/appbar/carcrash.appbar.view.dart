import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/appbar/carcrash.appbar.controller.dart';

class CarCrashAppBar extends SFW with PreferredSizeWidget {
  CarCrashAppBar({Key? key, required controller})
      : super(key: key, controller: controller);

  CarCrashAppBarController get getController =>
      controller as CarCrashAppBarController;

  @override
  initState() {}

  @override
  Widget build() {
    return AppBar(
      title: Text("Araba Kazası Asistanı"),
    );
  }

  @override
  isBuilded() {}

  @override
  Size get preferredSize => Size.fromHeight(60);
}
