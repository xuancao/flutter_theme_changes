import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/view/MineMenuItem.dart';
import 'package:flutter_theme_changes/mine/ThemePage.dart';
import 'package:flutter_theme_changes/resource/Drawable.dart';

class MinePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: new Text("我的", style: new TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body:ListView(
        children: <Widget>[
          MineMenuItem(
            icon: Drawable.DRAWABLE_IC_SETTING,
            title: "主题色设置",
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return ThemePage();
              }));
            },
          ),
        ],
      ),
    );
  }

}