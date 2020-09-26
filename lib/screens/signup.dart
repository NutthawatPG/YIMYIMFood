import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:yimyimfood/utility/normal_dialog.dart';
import 'package:yimyimfood/utility/my_style.dart';
import 'package:yimyimfood/utility/warning_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          showAppName(),
          MyStyle().mySizedbox(),
          MyStyle().mySizedbox(),
          nameForm(),
          MyStyle().mySizedbox(),
          userForm(),
          MyStyle().mySizedbox(),
          passwordForm(),
          MyStyle().mySizedbox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyStyle().showTitleHeader2('Choose member type: '),
            ],
          ),
          userRadio(),
          shopRadio(),
          riderRadio(),
          MyStyle().mySizedbox(),
          saveButton(),
        ],
      ),
    );
  }

  Widget saveButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: RaisedButton(
              color: MyStyle().darkColor,
              onPressed: () {
                print(
                    'Name = $name , User = $user , Password = $password , chooseType = $chooseType');
                if (name == null ||
                    name.isEmpty ||
                    user == null ||
                    user.isEmpty ||
                    password == null ||
                    password.isEmpty ||
                    chooseType == null ||
                    chooseType.isEmpty) {
                  //print('Please fill name.');
                  normalDialog(context, 'Please fill value in every box.');
                } else {
                  checkUserDup();
                  //registerThread();
                }
              },
              child: Text(
                'Save',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      );

  Future<Null> registerThread() async {
    String url =
        'http://192.168.64.2/YIMYIMFood/addUser.php?isAdd=true&MemberType=$chooseType&Name=$name&User=$user&Password=$password';

    try {
      Response response = await Dio().get(url);
      //print('res = $response');
      if (response.toString() == 'true') {
        //normalDialog(context, 'Save completed');
        Navigator.pop(context);
      } else {
        warningDialog(context, 'Save failed. Please check values again');
      }
    } catch (e) {}
  }

  Future<Null> checkUserDup() async {
    String url =
        'http://192.168.64.2/YIMYIMFood/getUser.php?isAdd=true&User=$user';

    try {
      Response response = await Dio().get(url);
      //print('res = $response');
      if (response.toString() == 'null') {
        registerThread();
        //Navigator.pop(context);
      } else {
        warningDialog(
            context, 'Please check user value again, It is duplicated');
      }
    } catch (e) {}
  }

  Widget userRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 250.0,
          child: Row(
            children: <Widget>[
              Radio(
                value: 'User',
                groupValue: chooseType,
                onChanged: (value) {
                  setState(() {
                    chooseType = value;
                  });
                },
              ),
              Text('Customer', style: TextStyle(color: MyStyle().darkColor))
            ],
          ),
        ),
      ],
    );
  }

  Widget shopRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 250.0,
          child: Row(
            children: <Widget>[
              Radio(
                value: 'Shop',
                groupValue: chooseType,
                onChanged: (value) {
                  setState(() {
                    chooseType = value;
                  });
                },
              ),
              Text('Shop', style: TextStyle(color: MyStyle().darkColor))
            ],
          ),
        ),
      ],
    );
  }

  Widget riderRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 250.0,
          child: Row(
            children: <Widget>[
              Radio(
                value: 'Rider',
                groupValue: chooseType,
                onChanged: (value) {
                  setState(() {
                    chooseType = value;
                  });
                },
              ),
              Text('Rider', style: TextStyle(color: MyStyle().darkColor))
            ],
          ),
        ),
      ],
    );
  }

  Row showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTitle('YIMYIM Food'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().showLogo(),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => name = value.trim(),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.face,
                  color: MyStyle().darkColor,
                ),
                labelStyle: TextStyle(color: MyStyle().darkColor),
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          ),
        ],
      );
}
