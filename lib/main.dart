import 'package:flutter/material.dart';
import 'package:shop/pages/Category/category_screen.dart';
import 'package:shop/pages/Category/list_screen.dart';
import 'package:shop/pages/myProducts/my_products.dart';
import 'package:shop/pages/home/home_screen.dart';
import 'package:shop/pages/loading.dart';
import 'package:shop/pages/profile.dart';

import 'data/data.dart';

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
      // home: ProfilePage(),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,

      routes: {
        '/': (context) => Loading(),
        '/home': (context) => HomeScreen(),
        '/category' : (context) => CategoryScreen(),
        '/profile' : (context) => ProfilePage(),
        '/myProducts' : (context) => MyProducts(),
        '/cart' : (context) => ListScreen(items: Data.currentUser.purchases!, title: 'Cart',)

      },

    );
  }
}
