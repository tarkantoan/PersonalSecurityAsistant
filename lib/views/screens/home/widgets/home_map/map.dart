import 'package:flutter/material.dart';

class HomeMapsWidget extends StatefulWidget {
  const HomeMapsWidget({Key? key}) : super(key: key);

  @override
  _HomeMapsWidgetState createState() => _HomeMapsWidgetState();
}

class _HomeMapsWidgetState extends State<HomeMapsWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://cdn.discordapp.com/attachments/941760150950273055/942000869996634122/1447419287677.png')),
        ),
      ),
    );
  }
}
