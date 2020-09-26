import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:yimyimfood/screens/add_info_shop.dart';
import 'package:yimyimfood/utility/my_style.dart';

class AboutShop extends StatefulWidget {
  @override
  _AboutShopState createState() => _AboutShopState();
}

class _AboutShopState extends State<AboutShop> {
  Void routeToAddShop() {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => AddInfoShop(),
    );

    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyStyle().showTitleCenter(context, 'Please fill shop information'),
        MyStyle().mySizedbox(),
        addAndEditButton(),
      ],
    );
  }

  Row addAndEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 16.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => routeToAddShop(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
