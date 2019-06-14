import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/resource/Drawable.dart';
import 'package:flutter_theme_changes/resource/RColor.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeColor.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeModel.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeStore.dart';

class MineMenuItem extends StatelessWidget{

  String icon;
  String title;
  VoidCallback onPressed;

  MineMenuItem({Key key,this.icon,this.title,this.onPressed}):super(key:key);

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Column(
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.only(left:15,top: 10,right: 15,bottom: 10),
              child: new Row(
                children: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Image.asset(icon,width: 30,height: 30,),
                  ),
                  new Expanded(
                    child: new Text(
                      title,
                      style: new TextStyle(
                        color: Color(materialColor[ThemeStore.value<ThemeModel>(context).theme]),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                  Image.asset(Drawable.DRAWABLE_IC_RIGHT_ARROW,height: 20,width: 10,),
                ],
              ),
          ),
          new Padding(
              padding: const EdgeInsets.only(left: 15,right: 15),
              child: new Divider(color: new Color(RColor.lineColor),height: 1,),
          ),
        ],
      ),
    );
  }

}