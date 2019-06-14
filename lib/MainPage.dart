
import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/home/HomePage.dart';
import 'package:flutter_theme_changes/mine/MinePage.dart';
import 'package:flutter_theme_changes/themeConfig/ThemeStore.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() {
    return new _MainPageState();
  }
}

enum LayoutType{
  home,
  mine,
}

class _MainPageState extends State<MainPage>{

  String layoutName (LayoutType layoutType){
    switch (layoutType){
      case LayoutType.home:
        return '首页';
      case LayoutType.mine:
        return '我的';
      default:
        return '';
    }
  }

  LayoutType _layoutSelection = LayoutType.home;

  Color _colorTabMatching({LayoutType layoutSelection}){
    return _layoutSelection == layoutSelection ?  new Color(0xFFFF4D46) : new Color(0xFF333333);
  }

  BottomNavigationBarItem _buildItem({String icon,LayoutType layoutSelection}){
    String text = layoutName(layoutSelection);
    return BottomNavigationBarItem(
      icon: new Image.asset(icon,width: 25,height: 25,),
      title: Text(text,style: TextStyle(color: _colorTabMatching(layoutSelection: layoutSelection)),),
    );
  }

  Widget _buildButtonNavBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        _buildItem(
            icon: _layoutSelection == LayoutType.home ? "images/tab_home_select.png" :"images/tab_home.png",
            layoutSelection: LayoutType.home
        ),
        _buildItem(
            icon: _layoutSelection == LayoutType.mine ? "images/tab_mine_select.png" :"images/tab_mine.png",
            layoutSelection: LayoutType.mine
        ),
      ],
      onTap: _onSelectTab,
    );
  }

  void _onSelectTab(int index){
    switch (index){
      case 0:
        _onLayoutSelected(LayoutType.home);
        break;
      case 1:
        _onLayoutSelected(LayoutType.mine);
        break;
    }
  }

  void _onLayoutSelected(LayoutType selection){
    setState(() {
      _layoutSelection = selection;
    });
  }

  Widget _buildBody(){
    LayoutType layoutSelection = _layoutSelection;
    switch(layoutSelection){
      case LayoutType.home:
        return HomePage();
      case LayoutType.mine:
        return MinePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeStore.setWidgetCtx(context); // 初始化scaffold的上下文作为全局上下文，提供弹窗等使用。
    return new Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildButtonNavBar(),
    );
  }

}
