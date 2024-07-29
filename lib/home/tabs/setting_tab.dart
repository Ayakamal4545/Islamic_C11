import 'package:flutter/material.dart';
import 'package:islamic_c11/home/language_model.dart';
import 'package:islamic_c11/providers/my_provider.dart';
import 'package:provider/provider.dart';
import '../../colors.dart';
import '../../providers/locale_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SettingTab extends StatefulWidget {
  const SettingTab({Key? key}) : super(key: key);

  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
   String ? _selectedTheme;
   String? _selectedLanguage ;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize _selectedTheme with localized value now that context is available
    _selectedTheme = AppLocalizations.of(context)!.light;
    _selectedLanguage=AppLocalizations.of(context)!.english;
  }

  void _showThemeBottomSheet() {
    showModalBottomSheet( backgroundColor:Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: [
            _buildBottomSheet(
              context,
              [AppLocalizations.of(context)!.light, AppLocalizations.of(context)!.dark],
              _selectedTheme??"",
                  (String? newValue) {

                    _selectedTheme = newValue!;
                  var pro = Provider.of<MyProvider>(context, listen: false);
                  pro.toggleTheme();

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(backgroundColor:Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Wrap(
          children: Language.languageList().map((Language language) {
            return Consumer<LocaleProvider>(builder: (context, provider, snapshot) {
              return ListTile(
                title: Text(language.name),
                trailing: provider.language?.languageCode == language.languageCode ? Icon(Icons.check) : null,
                onTap: () {
                  provider.setLanguage(language);
                  Navigator.pop(context);
                },
              );
            });
          }).toList(),
        );
      },
    );
  }

  Widget _buildBottomSheet(
      BuildContext context,
      List<String> options,
      String selectedValue,
      ValueChanged<String?> onChanged) {
    return ListView(
      shrinkWrap: true,
      children: options.map((String value) {
        return ListTile(
          title: Text(value),
          trailing: selectedValue == value ? const Icon(Icons.check) : null,
          onTap: () {
            onChanged(value);
          },
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<MyProvider>(context);
    var localeProvider = Provider.of<LocaleProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: _showThemeBottomSheet,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(pro.themeMode==ThemeMode.light?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.dark, style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
           Text(
            AppLocalizations.of(context)!.language,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () => _showLanguageBottomSheet(context),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(  localeProvider.language?.name??"", style: const TextStyle(fontSize: 18)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
