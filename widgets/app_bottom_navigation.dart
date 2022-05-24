import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarBottomNavigation extends StatefulWidget {
  const AppBarBottomNavigation({Key? key}) : super(key: key);

  @override
  _AppBarBottomNavigationState createState() => _AppBarBottomNavigationState();
}

class _AppBarBottomNavigationState extends State<AppBarBottomNavigation> {

  List<dynamic> meneItems = [
    {
    'icon': 'assets/icons/home.svg',
    'label': 'Home'
    },
    {
      'icon': 'assets/icons/delivery.svg',
      'label': 'Delivery'
    },

    {
      'icon': 'assets/icons/wallet.svg',
      'label': 'Wallet'
    },
    {
      'icon': 'assets/icons/profile (1).svg',
      'label': 'Profile'
    },

  ];
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: meneItems.map((i){
      return BottomNavigationBarItem(
        icon: SvgPicture.asset(i['icon'],width: 30, height: 30,),
        label: i['label'],
        activeIcon: SvgPicture.asset(i['icon'],color: Colors.blue,),
      );
    }).toList());
  }
}
