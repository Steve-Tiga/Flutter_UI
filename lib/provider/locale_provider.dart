import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {

  final List<Locale> supportedLocales = const <Locale>[
    Locale('zh', 'CN'),
    Locale('en', 'US')
  ];

  Locale get locale {

  }

  void setLocale(String locale){
    notifyListeners();
  }
}