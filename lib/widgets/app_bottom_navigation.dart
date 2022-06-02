import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppBarBottomNavigation extends StatefulWidget {
  const AppBarBottomNavigation({Key? key}) : super(key: key);

  @override
  _AppBarBottomNavigationState createState() => _AppBarBottomNavigationState();
}

class _AppBarBottomNavigationState extends State<AppBarBottomNavigation> {
  int selectedItem = 0;
  List<dynamic> meneItems = [
    {
      'icon': 'assets/icons/home.svg',
      'label': 'Home',
      'page' : '/home'
    },

    {
      'icon': 'assets/icons/category.svg',
      'label': 'Category',
      'page' : '/category'
    },
    {
      'icon': 'assets/icons/delivery.svg',
      'label': 'MyProducts',
      'page' : '/myProducts'
    },
    {
      'icon': 'assets/icons/profile (1).svg',
      'label': 'Profile',
      'page' : '/profile'
    },

  ];
  void _onTapped(int index){
    setState(() {
      Navigator.pushNamed(context, meneItems[index]['page']);
      selectedItem = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showUnselectedLabels: true,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.black,
      elevation: 32,
      type: BottomNavigationBarType.fixed,
      
      items: meneItems.map((i){
      return BottomNavigationBarItem(
        icon: SvgPicture.asset(i['icon'],width: 20, height: 26,),
        label: i['label'],
        activeIcon: SvgPicture.asset(i['icon'],color: Colors.blue,),
      );
    }).toList(),
      selectedItemColor: Colors.grey,
      onTap: _onTapped,
      currentIndex: selectedItem,
    );

  }
}
