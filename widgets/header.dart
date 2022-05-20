import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/fake.dart';
import 'package:shop/widgets/search_bar.dart';

import 'cart.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24 ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nama Kala", style: TextStyle(fontSize: 28),),
              SizedBox(width: 10,),
              Cart(numberOfItemsInCart: Fake.numberOfItemsInCart),
            ],
          ),
          Text("Get unique things",
          style: TextStyle(fontSize: 15, height: 2, color: Colors.black26),
          ),
          SearchBar(),

        ],
      ),
    );
  }
}
