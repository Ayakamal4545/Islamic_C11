import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c11/hadeth_deatils_screen.dart';
import 'package:islamic_c11/home/home.dart';
import 'package:islamic_c11/my_them_data.dart';
import 'package:islamic_c11/providers/my_provider.dart';
import 'package:islamic_c11/sura_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'providers/locale_provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocaleProvider()),
        ChangeNotifierProvider(create: (context) => MyProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);
    final pro =Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      //themeMode:pro.appTheme,
      theme: pro.themeData,
      darkTheme: pro.darkTheme,
      themeMode: pro.themeMode,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
        HadethDeatilsScreen.routeName: (context) => HadethDeatilsScreen(),
      },
      locale: localeProvider.locale,
    );
  }
}

