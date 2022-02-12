import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.view.dart';

class CarCrashController extends SFWController {
  CarCrashController() : super();

  @override
  init() async {}

  CarCrashScreen get getView => view as CarCrashScreen;

  onTapBottomNav(int tappedIndex) {
    getView.state.setState(() {
      getView.selectedIndex = tappedIndex;
    });
  }
}
