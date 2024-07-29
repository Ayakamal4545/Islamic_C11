import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamic_c11/colors.dart';

class MyProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.dark; // Default theme mode

  ThemeMode get themeMode => _themeMode;

  ThemeData get themeData => _themeMode == ThemeMode.dark ? darkTheme : lightTheme;

  ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.colorBlack,
        ),
        shadowColor: Colors.transparent,
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.primaryColor,
        thickness: 3,
      ),
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
        size: 25,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Color(0xFF242424),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: AppColors.colorBlack,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: AppColors.colorBlack,
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.colorBlack,
        ),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
        secondary: AppColors.primaryColor,
        onSecondary: AppColors.primaryColor,
        error: AppColors.primaryColor,
        onError: AppColors.primaryColor,
        surface: AppColors.primaryColor,
        onSurface: AppColors.primaryColor,
      ),
    );
  }

  ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(size: 30, color: Colors.white),
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        shadowColor: Colors.transparent,
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.yellowColor,
        thickness: 3,
      ),
      iconTheme: IconThemeData(
        color: AppColors.yellowColor,
        size: 25,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: AppColors.yellowColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryDark,
        showUnselectedLabels: false,
        showSelectedLabels: true,
      ),
      textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: AppColors.yellowColor,
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: AppColors.primaryColor,
        onPrimary: AppColors.primaryColor,
        secondary: AppColors.primaryColor,
        onSecondary: AppColors.primaryColor,
        error: AppColors.primaryColor,
        onError: AppColors.primaryColor,
        surface: AppColors.primaryColor,
        onSurface: AppColors.primaryColor,
      ),
    );
  }

  void toggleTheme() {
    _themeMode = (_themeMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
