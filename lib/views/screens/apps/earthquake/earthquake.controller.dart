import 'package:personal_security_asistant/core/cRouter.class.dart';
import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'package:personal_security_asistant/views/screens/auth/auth.controller.dart';
import 'package:personal_security_asistant/views/screens/auth/auth.view.dart';

class EarthquakeController extends SFWController {
  double width = 50;
  double height = 50;

  EarthquakeController() : super();

  @override
  init() async {
    AuthController authController = AuthController();
    authController.ifLoggedIn().then((value) => value == false
        ? cRouter.push(
            AuthScreen(controller: authController),
          )
        : "");
  }
}
