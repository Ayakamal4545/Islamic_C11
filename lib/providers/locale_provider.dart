import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleProvider extends ChangeNotifier{


 String LAGUAGE_CODE = 'languageCode';

Locale _localeFromCode(String languageCode) {
  switch (languageCode) {
    case 'en':
      return const Locale('en', '');

    case 'ar':
      return const Locale('ar', "");

    default:
      return const Locale('en', '');
  }
}

 Locale? _locale;
 Locale? get locale => _locale;



  Future<void> setLocale(String languageCode) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(LAGUAGE_CODE, languageCode);
    _locale = _localeFromCode(languageCode);
    notifyListeners();
  }

  Future<Locale?> getLocale() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";
    _locale = _localeFromCode(languageCode);
    notifyListeners();
    return _locale;
  }




}