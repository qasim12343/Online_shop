import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/data/fake.dart';

import 'cart.dart';

class HeaderH extends StatefulWidget {
  const HeaderH({Key? key}) : super(key: key);

  @override
  _HeaderHState createState() => _HeaderHState();
}

class _HeaderHState extends State<HeaderH> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1),blurRadius: 10, offset: Offset(0, 10)),
        ]
      ),
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 28),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 60,
                alignment: Alignment.centerLeft,
                child: InkWell(
                  child: SvgPicture.asset('assets/icons/back.svg',),
                  onTap: ((){
                      Navigator.pop(context);
                  }),
                ),
              ),
              Text('Digital', style: TextStyle(fontSize: 18),),
              Container(
                width: 60,
                alignment: Alignment.centerRight,
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                  SvgPicture.asset('assets/icons/search.svg', height: 18,),
                  SizedBox(
                    width: 10,
                  ),
                  Cart(numberOfItemsInCart: Fake.numberOfItemsInCart,)
                ],),
              )
            ],
          ),
        ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: (){},
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    children: [
                    SvgPicture.asset('assets/icons/controls.svg'),
                    Stack(
                      clipBehavior: Clip.none, children: [
                        Text('Filter'),
                        Positioned(
                          top: -3,
                          right: -12,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 1, color: Colors.blue)
                            ),
                            height: 14,
                            width: 14,
                            child: SvgPicture.asset('assets/icons/tick.svg',height: 5,color: Colors.white,),
                        ))
                      ],
                    )
                  ],
                  ),
                )
              ],
            ),
          )
      ],),
    );
  }
}
