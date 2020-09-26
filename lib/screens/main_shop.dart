import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yimyimfood/screens/signup.dart';
import 'package:yimyimfood/screens/singin.dart';
import 'package:yimyimfood/utility/my_style.dart';
import 'package:yimyimfood/utility/signout.dart';
import 'package:yimyimfood/widget/about.dart';
import 'package:yimyimfood/widget/food.dart';
import 'package:yimyimfood/widget/order.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  //Field
  Widget currentWidget = OrderListShop();

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            myHomeMenu(),
            myFoodMenu(),
            myAboutMenu(),
            //signINMENU(),
            //signUPMENU(),
          ],
        ),
      );

  ListTile myHomeMenu() => ListTile(
        leading: Icon(Icons.favorite),
        title: Text('Customer Order'),
        subtitle: Text('Food in Queue'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile myFoodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        subtitle: Text('Edit - Food Menu'),
        title: Text('Food Menu'),
        onTap: () {
          setState(() {
            currentWidget = FoodMenuShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile myAboutMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('About'),
        subtitle: Text('Edit - Shop Information'),
        onTap: () {
          setState(() {
            currentWidget = AboutShop();
          });
          Navigator.pop(context);
        },
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
        decoration: MyStyle().myBoxHeader('shop.jpg'),
        //currentAccountPicture: MyStyle().showLogo(),
        accountName: Text(
          'Welcome',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        accountEmail: Text(
          'Shop Name Login',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Shop'), actions: [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () => routeToHomePage(context),
        ),
      ]),
      drawer: showDrawer(),
      body: currentWidget,
    );
  }
}
