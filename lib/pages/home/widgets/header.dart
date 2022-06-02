import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/widgets/search_bar.dart';

import '../../../widgets/cart.dart';

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
              Row(children: [
                Text("NamaKala", style: TextStyle(fontSize: 28, color: Colors.red),),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("نماکالا",style: TextStyle(
                      fontSize: 20,
                      color: Colors.blue[800]
                  ),),
                ),
              ],
              ),

              SizedBox(width: 10,),
              Cart(numberOfItemsInCart: Data.numberOfItemsInCart),
            ],
          ),
          Text("Get unique products",
          style: TextStyle(fontSize: 15, height: 2, color: Colors.black26),
          ),
          SizedBox(
            height: 10,
          ),
          SearchBar(),


        ],
      ),
    );
  }
}
