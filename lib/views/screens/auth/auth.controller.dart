import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:personal_security_asistant/classes/user.class.dart';
import 'package:personal_security_asistant/core/cRouter.class.dart';
import 'package:personal_security_asistant/core/swf.controller.class.dart';
import 'package:personal_security_asistant/model/user.model.dart';
import 'package:personal_security_asistant/repository/user.repository.dart';
import 'package:personal_security_asistant/utilities/general.dart';
import 'package:personal_security_asistant/views/screens/auth/auth.view.dart';
import 'package:personal_security_asistant/views/screens/home/home.controller.dart';
import 'package:personal_security_asistant/views/screens/home/home.view.dart';

class AuthController extends SFWController {
  bool passwordObscureText = true;

  cUser user = cUser();
  String phoneNumber = "";
  @override
  AuthController() : super();

  Map<String, TextEditingController> formController = {
    "phone": TextEditingController(),
    "code": TextEditingController(),
  };

  @override
  init() async {}

  Future<bool> ifLoggedIn() async {
    if (FirebaseAuth.instance.currentUser != null) {
      final user = cUser();
      UserRepository userRepository = UserRepository();
      UserModel? model = await userRepository
          .getFromId(FirebaseAuth.instance.currentUser!.uid);
      if (model == null) {
        user.model = UserModel(ID: FirebaseAuth.instance.currentUser!.uid);
      } else {
        user.model = model;
      }
      loginSuccess(user);
      return true;
    }
    return false;
  }

  onClickLogin() async {
    bool result = await user.phoneVerification(phoneNumber);

    if (!result) {
      loginFail();
      return;
    }
    getView.openVerificationSMS();
  }

  AuthScreen get getView => view as AuthScreen;

  loginFail() {
    print("Giriş başarısız");
  }

  loginSuccess(cUser user) {
    General.setUser(user);
    HomeController homeController = HomeController();
    HomeScreen homeScreen = HomeScreen(
      controller: homeController,
    );
    cRouter.pushAndRemoveUntil(homeScreen);
  }
}
