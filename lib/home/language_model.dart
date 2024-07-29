class Language {

  final String name;
  final String languageCode;

  Language( this.name, this.languageCode);

  static List<Language> languageList() {
    return <Language>[
      Language( "English", "en"),
      Language(  "اَلْعَرَبِيَّةُ", "ar"),
    ];
  }
}
