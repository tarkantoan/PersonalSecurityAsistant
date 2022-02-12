import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/widgets/eq.appbar.controller.dart';

class EQAppBar extends SFW with PreferredSizeWidget {
  EQAppBar({Key? key, required controller})
      : super(key: key, controller: controller);

  EQAppBarController get getController => controller as EQAppBarController;

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
