import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
   final int numberOfItemsInCart ;
   const Cart({Key? key, required this.numberOfItemsInCart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, children: [
        Container(
          width: 24,
          height: 24,
          child: Icon(Icons.add_shopping_cart),
        ),
        if(numberOfItemsInCart > 0)
        Positioned(
          width: 12,
          height: 12,
          top: -4,
          right: -4,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                )
            ),
            child: Text("$numberOfItemsInCart",
              style: TextStyle(fontSize: 8,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),

            ),
          ),
        )
      ],
    );
  }
}
