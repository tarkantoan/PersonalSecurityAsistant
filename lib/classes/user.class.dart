import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_security_asistant/model/user.model.dart';
import 'package:personal_security_asistant/repository/user.repository.dart';
import 'package:personal_security_asistant/utilities/general.dart';

class cUser with ChangeNotifier {
  final _userRepository = UserRepository();

  UserModel? model = UserModel(ID: "ID");

  cUser();

  String? verificationId;
  Future<cUser?> confirmPhoneCode(String code) async {
    UserCredential usercred;
    try {
      PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: verificationId!, smsCode: code);
      usercred = await FirebaseAuth.instance.signInWithCredential(cred);
    } catch (e) {
      return null;
    }
    if (usercred.user == null) {
      return null;
    }

    UserRepository userRepository = UserRepository();

    UserModel? userModel = await userRepository.getFromId(usercred.user!.uid);

    if (userModel != null) {
      this.model = userModel;
    } else {
      model!.ID = usercred.user!.uid;
    }
    return this;
  }

  Future<bool> phoneVerification(String phoneNumber) async {
    // confirmationResult =
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (verificationCompleted) {},
        verificationFailed: (verificationFailed) {},
        codeSent: (verificationId, test) {
          this.verificationId = verificationId;
        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) {});
    return true;
  }
}
