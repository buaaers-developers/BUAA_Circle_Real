import 'package:buaacircle/category/category.dart';
import 'package:buaacircle/message/message.dart';
import 'package:flutter/material.dart';

class CircleRoute extends StatefulWidget {
  @override
  _CircleRouteState createState() => _CircleRouteState();
}

class _CircleRouteState extends State<CircleRoute>
    with SingleTickerProviderStateMixin {

  Image generalFace = new Image.asset(
    "assets/face2.jpg",
    width: 40.0,
    height: 40.0,
    fit: BoxFit.cover,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(50),
//        child: AppBar(
//          backgroundColor: Colors.blue.shade500,
//        ),
//      ),
      body: ListView(
        children: messages.map((message) =>
           ListTile(
             leading: generalFace,
             title: new Text(message.groupName),
             subtitle: new Text(message.content),
             trailing: message.category.icon,
           )
        ).toList(),
      ),
    );
  }

}
