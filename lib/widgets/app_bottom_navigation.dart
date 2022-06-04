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
      'icon': 'assets/icons/cart.svg',
      'label': 'Cart',
      'page' : '/cart'
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
      selectedItem = index;
      Navigator.pushNamed(context, meneItems[index]['page']);
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue[200],
      unselectedItemColor: Colors.black,
      // elevation: 32,
      type: BottomNavigationBarType.fixed,
      currentIndex: selectedItem,
      selectedItemColor: Colors.black,
      onTap: _onTapped,

      items: meneItems.map((i){
      return BottomNavigationBarItem(
        icon: SvgPicture.asset(i['icon'],height: 25,width: 25,),
        label: i['label'],
        activeIcon: SvgPicture.asset(i['icon'],height: 25,width: 25),
      );
    }).toList(),

    );

  }
}
