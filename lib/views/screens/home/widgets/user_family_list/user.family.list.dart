import 'package:flutter/material.dart';

class UserFamilyView extends StatefulWidget {
  const UserFamilyView({Key? key}) : super(key: key);

  @override
  _UserFamilyViewState createState() => _UserFamilyViewState();
}

class _UserFamilyViewState extends State<UserFamilyView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Icon(
            Icons.location_on,
            size: 36,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(
            width: 10,
          ),
          UserFamilyCard(
              text: 'Alihan Şişman',
              imageUrl:
                  "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg",
              subtitle: 'Evde Uyuyor',
              onPressed: () {}),
          SizedBox(
            width: 15,
          ),
          UserFamilyCard(
              text: 'Alihan Şişman',
              imageUrl:
                  "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg",
              subtitle: 'Evde Uyuyor',
              onPressed: () {}),
          SizedBox(
            width: 15,
          ),
          UserFamilyCard(
              text: 'Alihan Şişman',
              imageUrl:
                  "https://profilemagazine.com/wp-content/uploads/2020/04/Ajmere-Dale-Square-thumbnail.jpg",
              subtitle: 'Evde Uyuyor',
              onPressed: () {}),
        ],
      ),
    );
  }
}

class UserFamilyCard extends StatelessWidget {
  final String text;
  final String imageUrl;
  final String subtitle;
  final Function() onPressed;

  const UserFamilyCard(
      {required this.text,
      required this.imageUrl,
      required this.subtitle,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          SizedBox(
            child: ClipOval(
              child: Image.network(
                imageUrl,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: TextStyle(color: Colors.white60),
              ),
              SizedBox(height: 2),
              Text(subtitle),
            ],
          )
        ],
      ),
    );
  }
}
