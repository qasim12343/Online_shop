import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/data/data.dart';
import 'package:shop/pages/Category/list_screen.dart';
import 'package:shop/pages/Category/widgets/vertical_seperator.dart';
import 'package:shop/widgets/cart.dart';
import 'action_button.dart';
import 'filter_modal_bottom_sheet.dart';

class HeaderSliver implements SliverPersistentHeaderDelegate{
  final double minExtent;
  final double maxExtent;
  String title;
  bool isFavoritePage;

  HeaderSliver({required this.minExtent, required this.maxExtent, required this.title, this.isFavoritePage = true});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return HeaderH(title: title,isFavoritePage: this.isFavoritePage,);
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override

  TickerProvider? get vsync => null;

}
class HeaderH extends StatefulWidget {
  String title;
  bool isFavoritePage ;
  HeaderH({Key? key, required this.title, required this.isFavoritePage}) : super(key: key);

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

                SizedBox(width: 50,),
                Text(widget.title, style: TextStyle(fontSize: 18),),
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
                    settingModelBottomSheet(context);
                  },
                  active: true,
                ),
                VerticalSeparator(),
                if(!widget.isFavoritePage)
                ActionButton(title: 'Favorites',
                  iconPath: 'assets/icons/card.svg',
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>ListScreen(items: Data.currentUser.favorites!, title: 'Favorites',isFavoritePage: true,)));
                  },
                ),
              ],
            ),
          )
        ],),
    );
  }
}

void settingModelBottomSheet(context){
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