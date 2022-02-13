import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.view.dart';
import 'package:personal_security_asistant/views/screens/apps/earthquake/earthquake.dart';
import 'package:personal_security_asistant/views/screens/home/home.controller.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/appbar/home.appbar.view.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/bottom_nav/bottom.nav.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/home_main_widget.dart';
import 'package:personal_security_asistant/views/screens/scaffold_bulk_item/scaffold.bulk.item.dart';

class HomeScreen extends SFW {
  HomeScreen({Key? key, required controller})
      : super(key: key, controller: controller);

  HomeController get getController => controller as HomeController;

  @override
  Function get isBuildedCallbackFunction => () {};

  Earthquake earthquake = Earthquake();

  @override
  Widget build() {
    return HomeViewScreen();
  }

  @override
  initState() {}

  @override
  isBuilded() {}
}

class HomeViewScreen extends StatefulWidget {
  const HomeViewScreen({Key? key}) : super(key: key);

  @override
  _HomeViewScreenState createState() => _HomeViewScreenState();
}

class _HomeViewScreenState extends State<HomeViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(
          controller: HomeController(),
        ),
        body: HomeApps(),
        bottomNavigationBar: HomeViewButtonNavBar(),
        floatingActionButton: speedDial,
      ),
    );
  }
}
