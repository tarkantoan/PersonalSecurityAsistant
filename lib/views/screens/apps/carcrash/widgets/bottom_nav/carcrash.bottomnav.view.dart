import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';

class CarCrashBottomNav extends SFW with PreferredSizeWidget {
  CarCrashBottomNav({Key? key, required controller, required this.module})
      : super(key: key, controller: controller);
  CarCrashController module;
  CarCrashController get getController => module as CarCrashController;

  @override
  initState() {}

  @override
  Widget build() {
    return BottomNavigationBar(
        currentIndex: module.getView.selectedIndex,
        onTap: getController.onTapBottomNav,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.map_outlined),
            label: "Harita",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined), label: "Ayarlar"),
        ]);
  }

  @override
  isBuilded() {}

  @override
  Size get preferredSize => Size.fromHeight(60);
}
