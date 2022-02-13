import 'package:flutter/material.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:timer_count_down/timer_controller.dart';

class CallEmergency extends StatefulWidget {
  const CallEmergency({Key? key}) : super(key: key);

  @override
  _CallEmergencyState createState() => _CallEmergencyState();
}

class _CallEmergencyState extends State<CallEmergency> {
  final CountdownController _controller =
      new CountdownController(autoStart: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: Colors.red),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Siren Aktive Edildi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                      'Acil durum!\n birazdan polise ve daha önceden seçtiğiniz kişilere konumunuz gönderilecek!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
              Countdown(
                controller: _controller,
                seconds: 5,
                build: (_, double time) {
                  return Text(time.toString(),
                      style: TextStyle(
                        fontSize: 100,
                      ));
                },
                interval: Duration(milliseconds: 100),
                onFinished: () {
                  print('Aha yarra yedin');
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff272072),
                        child: IconButton(
                          icon: Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.pause();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("ARA")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _controller.pause();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("İPTAL")
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Color(0xff272072),
                        child: IconButton(
                          icon: Icon(
                            Icons.video_call_sharp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _controller.pause();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Video"),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
