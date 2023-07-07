import 'package:flutter/material.dart';
import 'package:test_project/View/AppBarTop.dart';
import 'package:test_project/View/BodyPage.dart';
class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBarTop(),
        BodyPage(),
      ],
    );
  }
}





