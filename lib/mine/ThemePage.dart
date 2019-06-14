import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/resource/Drawable.dart';
import 'package:flutter_theme_changes/resource/RColor.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeModel.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeStore.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeColor.dart';

class ThemePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _ThemeState();
  }
}

class _ThemeState extends State<ThemePage>{

  @override
  Widget build(BuildContext context) {
    List<Widget> _EdageList = [];
    materialColor.forEach((k, v) {
      _EdageList.add(this.Edage(k, v, context));
    });

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("主题色设置"),
        ),
        body: ListView(
          children: <Widget>[
            ExpansionTile(
              leading:  Image.asset(Drawable.DRAWABLE_IC_THEME,height: 30,width: 30,),
              title: Row(
                children: <Widget>[
                  Text(
                    "选择主题",
                    style: new TextStyle(
                        color: Color(materialColor[ThemeStore.value<ThemeModel>(context).theme]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 0, 0),
                    child: Container(
                      color: Color(materialColor[
                      ThemeStore.value<ThemeModel>(context).theme]),
                      height: 15,
                      width: 15,
                    ),
                  )
                ],
              ),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 5,
                    children: _EdageList,
                  ),
                )
              ],
            ),
            Divider(
              color: Color(RColor.lineColor),
            ),
          ],
        ));
  }

  Widget Edage(name, color, context) {
    return GestureDetector(
      onTap: () {
        ThemeStore.value<ThemeModel>(context).setTheme(name);
      },
      child: Container(
        color: Color(color),
        height: 30,
        width: 30,
      ),
    );
  }

}