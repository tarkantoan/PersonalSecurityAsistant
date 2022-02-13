import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.view.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/widgets/settings/carcrash.settings.controller.dart';

class CarCrashController extends SFWController {
  CarCrashController() : super();

  @override
  init() async {}

  CarCrashScreen get getView => view as CarCrashScreen;
  CarCrashSettingsController carCrashSettingsController =
      CarCrashSettingsController();

  onTapBottomNav(int tappedIndex) {
    getView.state.setState(() {
      getView.selectedIndex = tappedIndex;
    });
  }
}
