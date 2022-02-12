import 'package:firebase_auth/firebase_auth.dart';
import 'package:personal_security_asistant/classes/user.class.dart';
import 'package:personal_security_asistant/core/cRouter.class.dart';
import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'package:personal_security_asistant/model/user.model.dart';
import 'package:personal_security_asistant/repository/user.repository.dart';
import 'package:personal_security_asistant/views/screens/auth/auth.controller.dart';
import 'package:personal_security_asistant/views/screens/auth/auth.view.dart';

class AppController extends SFWController {
  double width = 50;
  double height = 50;

  AppController() : super();

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
