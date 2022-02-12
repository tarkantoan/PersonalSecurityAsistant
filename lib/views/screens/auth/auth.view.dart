import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'package:personal_security_asistant/views/screens/auth/auth.controller.dart';

class AuthScreen extends SFW {
  AuthScreen({Key? key, required controller})
      : super(key: key, controller: controller) {
    getController.passwordObscureText = true;
  }

  AuthController get getController => controller as AuthController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build() {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.abc_rounded), label: "s"),
          BottomNavigationBarItem(icon: Icon(Icons.abc), label: "c"),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(),
        height: MediaQuery.of(state.context).size.height,
        width: MediaQuery.of(state.context).size.width,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 80),
                  //   child: Image.network(),
                  // ),
                  Card(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            child: IntlPhoneField(
                              controller: getController.formController["phone"],
                              decoration: InputDecoration(
                                labelText: 'Telefon Numarası',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                ),
                              ),
                              initialCountryCode: 'TR',
                              onChanged: (phone) {
                                getController.phoneNumber =
                                    phone.completeNumber;
                              },
                              onCountryChanged: (country) {
                                print('Country changed to: ' + country.name);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                          ),
                          onPressed: () {
                            getController.onClickLogin();
                          },
                          child: Text("Telefonu Doğrula"),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
