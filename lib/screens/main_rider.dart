
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yimyimfood/screens/signup.dart';
import 'package:yimyimfood/screens/singin.dart';
import 'package:yimyimfood/utility/my_style.dart';
import 'package:yimyimfood/utility/signout.dart';


class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {

Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            signINMENU(),
            signUPMENU(),
          ],
        ),
      );

       ListTile signINMENU() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign IN'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUPMENU() {
    return ListTile(
      leading: Icon(Icons.replay),
      title: Text('Sign UP'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() => UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxHeader('rider.jpg'),
        //currentAccountPicture: MyStyle().showLogo(),
        accountName: MyStyle().showTitleHeader2('Welcome'),
        accountEmail: Text(
          'Rider Name Login',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Rider'), actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () => routeToHomePage(context),
        ),
      ]),
      drawer: showDrawer(),
    );
  }
}
