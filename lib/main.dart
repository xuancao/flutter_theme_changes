import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/MainPage.dart';
import 'package:flutter_theme_changes/themeConfig/AppTheme.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeModel.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeStore.dart';

void main() => runApp(ThemeStore.init(child: MyApp()));

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{

  @override
  void initState() {
    super.initState();
    ThemeStore.setStoreCtx(context);// 初始化数据层
  }

  @override
  Widget build(BuildContext context) {
    ThemeStore.value<ThemeModel>(context).getTheme();
//    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.red,
//      ),
//      home: MainPage(),
//    );
      return ThemeStore.connect<ThemeModel>(
        builder: (context,child,model){
          return MaterialApp(
            theme: AppTheme.getThemeData(model.theme),
            home: MainPage(),
          );
        }
      );
  }

}