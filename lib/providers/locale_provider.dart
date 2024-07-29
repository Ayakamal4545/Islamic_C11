import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/language_model.dart';

class LocaleProvider extends ChangeNotifier{


 String LAGUAGE_LOCALE = 'LOCALE';



 Language _language=Language.languageList()
     .first;
 Language? get language =>_language;



  Future<void> setLanguage(Language language) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(LAGUAGE_LOCALE, language.languageCode);
    _language =language;
    notifyListeners();
  }

  Future<Language?> getLanguage() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String languageCode = _prefs.getString(LAGUAGE_LOCALE) ?? "en";
    _language = Language.languageList().firstWhere(
          (language) => language.languageCode == languageCode,
      orElse: () => Language.languageList()
          .first, // Handle the case where the language is not found
    );
    notifyListeners();
    return _language;
  }




}