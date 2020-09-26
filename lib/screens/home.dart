import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yimyimfood/screens/main_customer.dart';
import 'package:yimyimfood/screens/main_rider.dart';
import 'package:yimyimfood/screens/main_shop.dart';
import 'package:yimyimfood/screens/signup.dart';
import 'package:yimyimfood/screens/singin.dart';
import 'package:yimyimfood/utility/my_style.dart';
import 'package:yimyimfood/utility/normal_dialog.dart';
import 'package:yimyimfood/utility/signout.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkPersistedUser();
  }

  Future<Null> checkPersistedUser() async {
    try {
      SharedPreferences myPerfer = await SharedPreferences.getInstance();
      String myPersistedMember = myPerfer.getString('membertype');
      if (myPersistedMember != null && myPersistedMember.isNotEmpty) {
        if (myPersistedMember == 'Customer') {
          routeToService(MainCustomer());
        } else if (myPersistedMember == 'Shop') {
          routeToService(MainShop());
        } else if (myPersistedMember == 'Rider') {
          routeToService(MainRider());
        } else {
          normalDialog(context, 'Please sign-in');
        }
      }
    } catch (e) {}
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute routepage = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, routepage, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), actions: [
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () => signOutProcress(),
        ),
      ]),
      drawer: showDrawer(),
    );
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
        decoration: MyStyle().myBoxHeader('guest.jpg'),
   //currentAccountPicture: MyStyle().showLogo(),
        accountName: Text('Guest'),
        accountEmail: Text('Please Login'),
      );
}
