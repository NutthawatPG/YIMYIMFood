import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:yimyimfood/utility/my_style.dart';

class AddInfoShop extends StatefulWidget {
  @override
  _AddInfoShopState createState() => _AddInfoShopState();
}

class _AddInfoShopState extends State<AddInfoShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information Shop'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          nameField(),
          addressField(),
          contactField(),
          MyStyle().mySizedbox(),
          groupImageField(),
          MyStyle().mySizedbox(),
          showShopLocation(),
          MyStyle().mySizedbox(),
          saveButton(),
        ],
      ),
    );
  }

  RaisedButton saveButton() {
    return RaisedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.save),
          label: Text('Save'),
        );
  }

  Container showShopLocation() {
    //Reference map start location point
    LatLng mylatLng = LatLng(13.317327, 100.9309969);
    CameraPosition cameraPosition = CameraPosition(
      target: mylatLng,
      zoom: 16.0,
    );

    return Container(
      height: 200.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
      ),
    );
  }

  Row groupImageField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        IconButton(
          iconSize: 36.0,
          icon: Icon(Icons.add_a_photo),
          onPressed: () {},
        ),
        Container(
          width: 150.0,
          child: Image.asset(
            'images/shop.jpg',
            fit: BoxFit.cover,
          ),
        ),
        IconButton(
          iconSize: 36.0,
          icon: Icon(Icons.add_photo_alternate),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget nameField() => Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320.0,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.shop,
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
        ),
      );

  Widget addressField() => Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320.0,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.home,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Address',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              ),
            ),
          ],
        ),
      );

  Widget contactField() => Container(
        margin: EdgeInsets.only(top: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 320.0,
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: MyStyle().darkColor,
                  ),
                  labelStyle: TextStyle(color: MyStyle().darkColor),
                  labelText: 'Contact',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().darkColor)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: MyStyle().primaryColor)),
                ),
              ),
            ),
          ],
        ),
      );
}
