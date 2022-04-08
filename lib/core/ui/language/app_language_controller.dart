import 'package:flutter/material.dart';
import 'package:futurama/core/core_export.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppLanguageController extends BaseProvider {
  Locale _appLocale =const Locale('en');
    final SharedPreferences localDataSource;

     AppLanguageController({required this.localDataSource}){
        toggleLang = true;
         loadToggleLang();
         fetchLocale();
     }



  Locale get appLocal => _appLocale;
  fetchLocale() async {
   
    if (localDataSource.getString('language_code') == null) {
      _appLocale = const Locale('en');
      return Null;
    }
    _appLocale = Locale( localDataSource.getString('language_code')?? 'en');
    return Null;
  }


  void changeLanguage(Locale type) async {
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("es")) {
      _appLocale = const Locale("es");
      await localDataSource.setString('language_code', 'es');
      await localDataSource.setString('countryCode', '');
    } else {
      _appLocale = const Locale("en");
      await localDataSource.setString('language_code', 'en');
      await localDataSource.setString('countryCode', 'US');
    }
    notifyListeners();
  }

    bool toggleLang = true;
   toggleLanguage() async {
    toggleLang = !toggleLang;
   

    if(toggleLang){
        _appLocale =  const Locale("en");
          changeLanguage(_appLocale);
        
    }else{
       _appLocale =  const Locale("es");
        changeLanguage(_appLocale);
    }
      saveToggleLang();
      notifyListeners();
  }

  loadToggleLang() async {
    
    toggleLang = localDataSource.getBool("toggleLang") ?? true;

    notifyListeners();
  }

  saveToggleLang() async {
  
    localDataSource.setBool("toggleLang", toggleLang);
  }

  Locale get currentAppLocal{
    return _appLocale;
  }


}