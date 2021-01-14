import 'package:covid19_tracker_app/pages/detail_pages.dart';
import 'package:covid19_tracker_app/pages/home_page.dart';
import 'package:covid19_tracker_app/themes/constant.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        fontFamily: "lato",
      ),
      initialRoute: "/",
      routes: {
        "/": (_) => HomePage(),
        "/detail": (_) => DetailPage(),
      },
    );
  }
}
