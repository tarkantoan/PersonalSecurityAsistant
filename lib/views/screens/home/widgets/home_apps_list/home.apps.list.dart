import 'package:flutter/material.dart';
import 'package:personal_security_asistant/core/cRouter.class.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.controller.dart';
import 'package:personal_security_asistant/views/screens/apps/carcrash/carcrash.view.dart';

class AppsGrid extends StatefulWidget {
  const AppsGrid({Key? key}) : super(key: key);

  @override
  AppsGridState createState() => AppsGridState();
}

class AppsGridState extends State<AppsGrid> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              HomeAppsCard(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2Fillustrations%2Fillustration1.png?alt=media&token=901c672d-0f35-49ee-8543-1e27a0891a1c",
                text: 'Yol Asistanı',
                subtitle: 'Sürüşünüzü daha güvenli hale getirin',
                onPressed: () {
                  CarCrashController carCrashController = CarCrashController();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) {
                      return CarCrashScreen(controller: carCrashController);
                    }),
                  );
                  // cRouter.push(
                  //   CarCrashScreen(controller: carCrashController),
                  // );
                },
              ),
              SizedBox(
                width: 10,
              ),
              HomeAppsCard(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2Fillustrations%2Fillustration1.png?alt=media&token=901c672d-0f35-49ee-8543-1e27a0891a1c",
                text: 'Deprem Asistanı',
                subtitle: 'Bölgenizdeki depremlerdeki güvenliğinizi arttırın.',
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              HomeAppsCard(
                imageUrl:
                    "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/finance_app_2%2Fillustrations%2Fillustration1.png?alt=media&token=901c672d-0f35-49ee-8543-1e27a0891a1c",
                text: 'Acil Servis Asistanı',
                subtitle:
                    'Güvenlik ve sağlık hizmetlerinden kolay şekilde yararlanın',
                onPressed: () {
                  CarCrashController carCrashController = CarCrashController();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) {
                      return CarCrashScreen(controller: carCrashController);
                    }),
                  );
                  // cRouter.push(
                  //   CarCrashScreen(controller: carCrashController),
                  // );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeAppsCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const HomeAppsCard(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 20,
      height: 200,
      child: Card(
        color: Color(0xff262626),
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.network(imageUrl, height: 59, fit: BoxFit.cover),
                const Spacer(),
                Text(text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
