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
  openVerificationSMS() {
    showModalBottomSheet(
        isScrollControlled: true,
        useRootNavigator: true,
        context: state.context,
        builder: (context) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    maxLength: 6,
                    decoration: const InputDecoration(
                      label: const Text("Doğrulama Kodu"),
                    ),
                    controller: getController.formController["code"],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      getController.user
                          .confirmPhoneCode(
                              getController.formController["code"]!.text)
                          .then((value) => value != null
                              ? getController.loginSuccess(value)
                              : "");
                    },
                    child: const Text("Doğrula"),
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 18)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build() {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('https://picsum.photos/seed/329/900'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_logo.png',
                  width: 100,
                  height: 100,
                )
              ],
            ),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: IntlPhoneField(
                            dropdownIcon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                            cursorColor: Colors.white,
                            controller: getController.formController["phone"],
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.white),
                              fillColor: Color.fromRGBO(255, 255, 255, 0.4),
                              labelText: 'Telefon Numarası',
                              labelStyle: const TextStyle(color: Colors.white),
                              border: const UnderlineInputBorder(
                                borderSide: BorderSide(),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                            ),
                            style: const TextStyle(
                                color: Colors.white,
                                decorationColor: Colors.white),
                            initialCountryCode: 'TR',
                            onChanged: (phone) {
                              getController.phoneNumber = phone.completeNumber;
                            },
                            onCountryChanged: (country) {
                              print('Country changed to: ' + country.name);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 40,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(
                              color: Color(0xff000000),
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          elevation: 1,
                        ),
                        onPressed: () {
                          getController.onClickLogin();
                        },
                        child: const Text("Telefonu Doğrula"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class AuthScreen2 extends StatefulWidget {
//   const AuthScreen2({Key? key}) : super(key: key);

//   @override
//   _AuthScreen2State createState() => _AuthScreen2State();
// }

// class _AuthScreen2State extends State<AuthScreen2> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: BoxDecoration(
//         image: DecorationImage(
//             image: NetworkImage('https://picsum.photos/seed/329/900'),
//             fit: BoxFit.cover),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.network(
//                 'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/flutterflow_assets/ff_logo.png',
//                 width: 100,
//                 height: 100,
//               )
//             ],
//           ),
//           Form(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Container(
//                 //   margin: EdgeInsets.only(bottom: 80),
//                 //   child: Image.network(),
//                 // ),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
//                   child: Column(
//                     children: [
//                       Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 0, horizontal: 20),
//                         child: IntlPhoneField(
//                           controller: getController.formController["phone"],
//                           decoration: InputDecoration(
//                             labelText: 'Telefon Numarası',
//                             border: UnderlineInputBorder(
//                               borderSide: BorderSide(),
//                             ),
//                           ),
//                           initialCountryCode: 'TR',
//                           onChanged: (phone) {
//                             getController.phoneNumber = phone.completeNumber;
//                           },
//                           onCountryChanged: (country) {
//                             print('Country changed to: ' + country.name);
//                           },
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 15),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 30),
//                         ),
//                         onPressed: () {
//                           getController.onClickLogin();
//                         },
//                         child: Text("Telefonu Doğrula"),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
