import 'package:flutter/material.dart';
import 'package:flutter_theme_changes/model/NetDot.dart';

class NetDot_Item extends StatelessWidget{

  NetDot netDot;

  VoidCallback onPressed;

  NetDot_Item({this.netDot,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPressed,
      child: new Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
        color: Colors.white,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Row(
              children: <Widget>[
                new Expanded(
                    child: Text(
                      netDot.title,
                      style: new TextStyle(color: new Color(0xFF333333),),
                    )),
                Text(
                  netDot.salary,
                  style: new TextStyle(color: new Color(0XFFFF4D46),fontSize: 18),
                ),
              ],
            ),
            new Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                    netDot.company,
                    style:new TextStyle(color: new Color(0xFF999999),fontSize: 15)
                ),
            ),
            new Container(
              decoration: new BoxDecoration(
                color: new Color(0xFFF6F6F6),
                borderRadius: new BorderRadius.all(new Radius.circular(5)),
              ),
              padding: const EdgeInsets.only(top: 3,bottom: 3,left: 8,right: 8),
              margin: const EdgeInsets.only(top: 10,bottom: 6),
              child: Text(
                netDot.info,
                style: new TextStyle(color: new Color(0xFF999999)),
              ),
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(netDot.head),
                  radius: 15,
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    netDot.publish,
                    style: new TextStyle(color: new Color(0xFF666666),fontSize: 15),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

}