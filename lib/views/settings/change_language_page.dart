import 'package:flutter_project/controllers/localization_controller.dart';
import 'package:flutter_project/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLanguagePage extends StatefulWidget {
  @override
  _ChangeCountryPageState createState() => _ChangeCountryPageState();
}

class _ChangeCountryPageState extends State<ChangeLanguagePage> {
  final LocalizationController localizationController =
      Get.put(LocalizationController());
  List<String> languages = [
    'Arabic',
    'English',
    'French',
  ];

  String currentLanguage = '';

  @override
  void initState() {
    super.initState();
    // Load the currently selected language from the controller
    currentLanguage = localizationController.currentLanguage.value;
    print(currentLanguage);
    // If no language is configured yet, default to English
    if (currentLanguage.isEmpty) {
      currentLanguage = 'English';
    } else {
      if (currentLanguage == "en-US") {
        currentLanguage = 'English';
      } else if (currentLanguage == "fr-FR") {
        currentLanguage = 'French';
      } else if (currentLanguage == "ar-MA") {
        currentLanguage = 'Arabic';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          'settings'.tr,
          style: TextStyle(color: darkGrey),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'language'.tr,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Flexible(
                child: ListView(
                  children: languages
                      .map((l) => ListTile(
                            onTap: () {
                              setState(() {
                                currentLanguage = l;
                              });
                              if (l == 'Arabic') {
                                localizationController.changeLanguage(
                                    'ar', 'MA');
                              } else if (l == 'English') {
                                localizationController.changeLanguage(
                                    'en', 'US');
                              } else if (l == 'French') {
                                localizationController.changeLanguage(
                                    'fr', 'FR');
                              }
                            },
                            title: Text(
                              l,
                              style: TextStyle(fontSize: 14),
                            ),
                            trailing: l == currentLanguage
                                ? Icon(
                                    Icons.check_circle,
                                    color: yellow,
                                    size: 16,
                                  )
                                : SizedBox(),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
