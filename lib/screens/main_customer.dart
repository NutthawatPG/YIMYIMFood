import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yimyimfood/screens/signup.dart';
import 'package:yimyimfood/screens/singin.dart';
import 'package:yimyimfood/utility/my_style.dart';
import 'package:yimyimfood/utility/signout.dart';


class MainCustomer extends StatefulWidget {
  @override
  _MainCustomerState createState() => _MainCustomerState();
}

class _MainCustomerState extends State<MainCustomer> {
  String nameUser;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences myperfer = await SharedPreferences.getInstance();
    setState(() {
      nameUser = myperfer.getString('name');
    });
  }

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
        decoration: MyStyle().myBoxHeader('customer.jpg'),
        //currentAccountPicture: MyStyle().showLogo(),
        accountName: MyStyle().showTitleHeader2('Welcome'),
        accountEmail: Text(
          'Name Login',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(nameUser == null ? 'Main Customer' : '$nameUser Login'),
          actions: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => routeToHomePage(context),
            ),
          ]),
      drawer: showDrawer(),
    );
  }
}
