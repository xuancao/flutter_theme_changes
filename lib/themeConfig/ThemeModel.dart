import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/utils/SpfUtils.dart';

class ThemeConfig{
  String theme = 'red';
}

class ThemeModel extends ThemeConfig with ChangeNotifier{

  final String _THEME = "theme";

  Future getTheme() async{
    String _theme = await SpfUtils.get(_THEME);
    if(_theme != null){
      setTheme(_theme);
    }
  }

  Future setTheme(payload) async{
    theme = payload;
    SpfUtils.set(_THEME, payload);
    notifyListeners();
  }
}