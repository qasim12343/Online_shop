import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarBottomNavigation extends StatefulWidget {
  const AppBarBottomNavigation({Key? key}) : super(key: key);

  @override
  _AppBarBottomNavigationState createState() => _AppBarBottomNavigationState();
}

class _AppBarBottomNavigationState extends State<AppBarBottomNavigation> {

  List<dynamic> meneItems = [
    {
    'icon': Icon(Icons.home_rounded),
    'label': 'Home'
    },
    {
      'icon': Icon(Icons.delivery_dining),
      'label': 'Delivery'
    },
    {
      'icon': Icon(Icons.person_sharp),
      'label': 'Profile'
    },
    {
      'icon': Icon(Icons.account_balance_wallet),
      'label': 'Wallet'
    },

  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: meneItems.map((i){
      return BottomNavigationBarItem(
        icon: i.icon,
        label: i.label,
      );
    }).toList());
  }
}
