import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:personal_security_asistant/core/sfw.class.dart';
import 'carcrash.settings.controller.dart';

class CarCrashSettings extends SFW {
  CarCrashSettings({Key? key, required controller})
      : super(key: key, controller: controller) {}

  CarCrashSettingsController get getController =>
      controller as CarCrashSettingsController;

  @override
  initState() {}

  @override
  Widget build() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Text(
                  'Sürüş asistanınızın sizlere hangi bildirimi göndermesini istediğinizi seçin.',
                  style: TextStyle(color: Colors.white60),
                ),
              ),
            ],
          ),
        ),
        CarSwitchWidget(
            text: 'Kötü Hava Koşulları',
            subtitle:
                'Bulunduğunuz ve ilerlediğiniz yönde hava koşulları sürüş için kötü ise size bildirim gönderir.',
            value: getController.realtimeTracker,
            onChanged: () {}),
        CarSwitchWidget(
            text: 'Kötü Yol Durumu',
            subtitle:
                'Bulunduğunuz ve ilerlediğiniz yönde yol durumu sürüş için kötü ise size bildirim gönderir.',
            value: getController.realtimeTracker,
            onChanged: () {}),
        CarSwitchWidget(
            text: 'Yol Çalışması',
            subtitle:
                'Bulunduğunuz ve ilerlediğiniz yönde yol çalışması mevcut ise size bildirim gönderir.',
            value: getController.realtimeTracker,
            onChanged: () {}),
        CarSwitchWidget(
            text: 'Hafif kazalar',
            subtitle: 'Yaralanma olmayan/nadir kazalar',
            value: getController.realtimeTracker,
            onChanged: () {}),
        CarSwitchWidget(
            text: 'Yoğun Kazalar',
            subtitle: 'Aynı bölgede yaşanan çoklu kazalar',
            value: getController.realtimeTracker,
            onChanged: () {}),
        CarSwitchWidget(
            text: 'Ölümlü Kazalar',
            subtitle: 'Bölgede yaşanan ölümlü kazalar',
            value: getController.realtimeTracker,
            onChanged: () {}),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
          child: ElevatedButton(
            onPressed: () async {},
            child: Text(
              'Değişkenleri Kaydet',
            ),
            style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                minimumSize: Size(190, 50),
                textStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                elevation: 3,
                side: BorderSide(
                  color: Colors.transparent,
                  width: 1,
                ),
                shape: StadiumBorder()),
          ),
        ),
      ],
    );
  }

  @override
  isBuilded() {}
}

//  Column(
//   children: [
//     ElevatedButton(
//         onPressed: () {
//           FlutterRingtonePlayer.stop();
//         },
//         child: Text("alarm")),
//     Switch(
//         value: getController.realtimeTracker,
//         onChanged: (sss) async {
//           state.setState(() {
//             getController.realtimeTracker = !getController.realtimeTracker;
//             getController.setTracker();
//           });
//         }),
//   ],
// );

class CarSwitchWidget extends StatelessWidget {
  final String text;
  final String subtitle;
  final bool value;
  final Function() onChanged;

  const CarSwitchWidget(
      {required this.text,
      required this.value,
      required this.subtitle,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (sss) async {
        onChanged;
      },
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
            fontFamily: 'Lexend Deca',
            color: Color(0xFF8B97A2),
            fontSize: 14,
            fontWeight: FontWeight.normal),
      ),
      activeColor: Color(0xFF4B39EF),
      activeTrackColor: Color(0xFF3B2DB6),
      dense: false,
      controlAffinity: ListTileControlAffinity.trailing,
      contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 24, 12),
    );
  }
}
