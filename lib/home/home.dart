import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c11/home/tabs/ahdeth_tab.dart';
import 'package:islamic_c11/home/tabs/quran_tab.dart';
import 'package:islamic_c11/home/tabs/radio_tab.dart';
import 'package:islamic_c11/home/tabs/sebha_tab.dart';
import 'package:islamic_c11/home/tabs/setting_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamic_c11/providers/my_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    final isDarkMode = provider.themeMode == ThemeMode.dark;
    return Stack(
      children: [
        Image.asset(
            isDarkMode ? "assets/images/main_dark.png"
                        : "assets/images/main_pg.png"
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.islami,),

          ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index){
                selectedIndex=index;
                setState(() {

                });
              },
              items: const [
              BottomNavigationBarItem(
                  icon:ImageIcon(AssetImage("assets/images/quran_icn.png")),label: "Quran" ),
                BottomNavigationBarItem(
                    icon:ImageIcon(AssetImage("assets/images/ahadeth.png")),label: "Ahadeth" ),
                BottomNavigationBarItem(
                    icon:ImageIcon(AssetImage("assets/images/sebha_blue.png")),label: "Sebha" ),
                BottomNavigationBarItem(
                    icon:ImageIcon(AssetImage("assets/images/radio.png")),label: "Radio" ),
              BottomNavigationBarItem(
                  icon:Icon(Icons.settings),label: "setting" ),
            ],),

        body:  tabs[selectedIndex],
        ),
      ],
    );
  }
  List<Widget>tabs=[
    QuranTab(),
    AhdethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab(),
    ];
}
