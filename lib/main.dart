import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tche_linux_caxias_do_sul/pages/home/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff00695c),
        primaryColorLight: Color(0xff439889),
        primaryColorDark: Color(0xff003d33),
        accentColor: Color(0xff7b1fa2),
      ),
      home: HomePage(),
    );
  }
}
