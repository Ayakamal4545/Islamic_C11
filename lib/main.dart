import 'package:flutter/material.dart';
import 'package:islamic_c11/hadeth_deatils_screen.dart';
import 'package:islamic_c11/home/home.dart';
import 'package:islamic_c11/sura_details_screen.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDeatilsScreen.routeName: (context) => HadethDeatilsScreen(),
      },
    );
  }
}
