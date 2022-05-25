import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/data/fake.dart';
import 'package:shop/pages/Category/widgets/vertical_seperator.dart';

import 'action_button.dart';
import '../../../widgets/cart.dart';
import 'filter_modal_bottom_sheet.dart';

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
        mainAxisSize: MainAxisSize.min,
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ActionButton(title: 'Filter',
                  iconPath: 'assets/icons/controls.svg',
                  onTap: (){
                    _settingModelBottomSheet(context);
                  },
                  active: true,
                ),
                VerticalSeparator(),
                ActionButton(title: 'Sort',
                  iconPath: 'assets/icons/sort.svg',
                  onTap: (){
                    _settingModelBottomSheet(context);
                  },
                ),
                VerticalSeparator(),
                ActionButton(title: 'List',
                  iconPath: 'assets/icons/list.svg',
                  onTap: (){
                    _settingModelBottomSheet(context);
                  },
                ),
              ],
            ),
          )
      ],),
    );
  }
}

void _settingModelBottomSheet(context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(9),
            topRight: Radius.circular(9),
        )
      ),
      context: context,
      builder: (BuildContext bc){
        return FilterModalBottomSheet(
        );
      }
    );
}



