import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:metro_icons/metro_icons.dart';
class RadioTab extends StatelessWidget {
  const RadioTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 40), // Adds space between the AppBar and the image
          Image.asset("assets/images/radio_bg.png"),
          SizedBox(height: 50), // Adds space between the image and the text
          Text(
            "اذاعة القران الكريم",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 90),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.arrow_back, size: 40),
              SizedBox(width: 20),
              Icon(FontAwesomeIcons.play, size: 40),
              SizedBox(width: 20),
              Icon(Icons.arrow_forward, size: 40),
            ],
          ),
        ],
      ),

    );
  }
}
