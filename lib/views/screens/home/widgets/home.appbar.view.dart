import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/home.appbar.controller.dart';

class HomeAppBar extends SFW with PreferredSizeWidget {
  HomeAppBar({Key? key, required controller})
      : super(key: key, controller: controller);

  HoneAppBarController get getController => controller as HoneAppBarController;

  @override
  initState() {}

  @override
  Widget build() {
    return AppBar(
      title: Text("Deprem Asistanı"),
    );
  }

  @override
  isBuilded() {}

  @override
  Size get preferredSize => Size.fromHeight(60);
}
