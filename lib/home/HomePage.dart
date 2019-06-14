import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/view/NetDot_Item.dart';
import 'package:flutter_theme_changes/model/NetDot.dart';

class HomePage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return new _HomePage();
  }
}

class _HomePage extends State<HomePage> with AutomaticKeepAliveClientMixin{

  List<NetDot> netDotList = List<NetDot>();

  @override
  void initState() {
    super.initState();
    for(int i=0; i<10; i++){
      NetDot netDot = new NetDot();
      netDot.title = "title";
      netDot.category = "category";
      netDot.company = "company";
      netDot.salary = "salary";
      netDot.head = "head";
      netDot.id = "1";
      netDot.publish = "publish";
      netDot.info = "info";
      netDotList.add(netDot);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0,
        centerTitle: true,
        title: new Text("主页", style: new TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body: new Center(
        child: _createListView(context),
      ),
    );
  }

  Widget _createListView(BuildContext context){
    return ListView.builder(
      key: new PageStorageKey("Home-list"),
        itemCount: netDotList.length,
        itemBuilder: (BuildContext context,int index){
          return new NetDot_Item(
            netDot: netDotList[index],
            onPressed: (){

          },);
        }
    );
  }

}