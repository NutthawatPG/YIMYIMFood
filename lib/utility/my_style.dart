import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.blue.shade900;
  Color primaryColor = Colors.green.shade400;

  SizedBox mySizedbox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 24.0,
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold),
      );

  Text showTitleHeader2(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold),
      );

  Widget showTitleCenter(BuildContext context,String title) {
    return Center(
      child: Container( 
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  BoxDecoration myBoxHeader(String imgNamePic) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/$imgNamePic'),
        fit: BoxFit.cover,
      ),
    );
  }

  MyStyle();
}
