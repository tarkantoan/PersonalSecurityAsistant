import 'package:flutter/material.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/home_apps_list/home.apps.list.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/home_map/map.dart';
import 'package:personal_security_asistant/views/screens/home/widgets/user_family_list/user.family.list.dart';

class HomeApps extends StatefulWidget {
  const HomeApps({Key? key}) : super(key: key);

  @override
  HomeAppsState createState() => HomeAppsState();
}

class HomeAppsState extends State<HomeApps> {
  @override
  Widget build(BuildContext context) {
    ScrollController scrollKey = ScrollController();
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        controller: scrollKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                children: [
                  Text(
                    'Hoşgeldin, Tarkan.',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: UserFamilyView(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  HomeMapsWidget(
                    parent: this,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: AppsGrid(),
            ),
          ],
        ),
      ),
    );
  }
}
