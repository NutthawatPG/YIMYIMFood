import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yimyimfood/model/user_model.dart';
import 'package:yimyimfood/screens/main_customer.dart';
import 'package:yimyimfood/screens/main_rider.dart';
import 'package:yimyimfood/screens/main_shop.dart';
//import 'package:yimyimfood/main.dart';
import 'package:yimyimfood/utility/my_style.dart';
import 'package:yimyimfood/utility/warning_dialog.dart';
//import 'package:yimyimfood/utility/normal_dialog.dart';
import 'package:dio/dio.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
// field
  String user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[Colors.white, MyStyle().primaryColor],
              center: Alignment(0, -0.3),
              radius: 1.0,
            ),
          ),
          child: Center(
              child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().showTitle('YIMYIM Food'),
                MyStyle().mySizedbox(),
                MyStyle().mySizedbox(),
                userForm(),
                MyStyle().mySizedbox(),
                passwordForm(),
                MyStyle().mySizedbox(),
                loginButton()
              ],
            ),
          )),
        ));
  }

  Widget loginButton() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().darkColor,
          onPressed: () {
            if (user == null ||
                user.isEmpty ||
                password == null ||
                password.isEmpty) {
              warningDialog(context, 'Please fill all values.');
            } else {
              checkAuthenUser();
            }
          },
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Future<Null> checkAuthenUser() async {
    String url =
        'http://192.168.64.2/YIMYIMFood/getUser.php?isAdd=true&User=$user';

    try {
      Response response = await Dio().get(url);
      //print('res = $response');

      var result = json.decode(response.data);
      print('res = $result');
      for (var map in result) {
        UserModel userModelset = UserModel.fromJson(map);
        if (password == userModelset.password) {
          String memberType = userModelset.membertype;
          if (memberType == 'Customer') {
            routeToService(MainCustomer(), userModelset);
          } else if (memberType == 'Shop') {
            routeToService(MainShop(), userModelset);
          } else if (memberType == 'Rider') {
            routeToService(MainRider(), userModelset);
          }
        } else {
          warningDialog(context, 'Please check your password');
        }
      }
    } catch (e) {}
  }

  Future<Null> routeToService(Widget myWidget, UserModel myUserModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('id', myUserModel.id);
    prefs.setString('membertype', myUserModel.membertype);
    prefs.setString('name', myUserModel.name);

    MaterialPageRoute routepage = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, routepage, (route) => false);
  }

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => user = value.trim(),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'User',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          onChanged: (value) => password = value.trim(),
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            labelStyle: TextStyle(color: MyStyle().darkColor),
            labelText: 'Password',
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );
}
