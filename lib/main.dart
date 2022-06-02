import 'package:flutter/material.dart';
import 'package:shop/data/category.dart';
import 'package:shop/pages/Category/category_screen.dart';
import 'package:shop/pages/Category/list_screen.dart';
import 'package:shop/pages/home/home_screen.dart';
import 'package:shop/pages/loading.dart';
import 'package:shop/pages/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'NamaKala',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        splashColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      // initialRoute: '/home',
      debugShowCheckedModeBanner: false,

      routes: {
        // '/': (context) => Loading(),
        '/home': (context) => HomeScreen(),
        '/list' : (context) => ListScreen(),
        '/category' : (context) => CategoryScreen(),
        '/profile' : (context) => Profile(),
        // '/myProducts' : (context) => MyProducts(),

      },

    );
  }
}
