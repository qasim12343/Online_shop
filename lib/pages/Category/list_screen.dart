import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/item.dart';
import 'package:shop/data/utilities.dart';
import 'package:shop/pages/Category/widgets/header_sliver.dart';
import 'package:shop/widgets/app_bottom_navigation.dart';
import 'package:shop/widgets/theme.dart';

import 'item_page.dart';

class ListScreen extends StatefulWidget {
  String title;
  List<Item> items;
  bool isFavoritePage;

  ListScreen({Key? key, required this.items, required this.title, this.isFavoritePage = false}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: AppBarBottomNavigation(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
                delegate: HeaderSliver(maxExtent: 120, minExtent: 120, title: widget.title, isFavoritePage: widget.isFavoritePage),
            ),

            SliverGrid.count(crossAxisCount: 2,
              childAspectRatio: 0.65,
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              children: widget.items.asMap().entries.map((e){
                  return GridItem(item: e.value);
                }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
class GridItem extends StatefulWidget {
  final Item item;
  GridItem({Key? key, required this.item}) : super(key: key);

  @override
  State<GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemPage(item: widget.item,)));
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black26, offset: Offset.zero, blurRadius: 5.0)
          ],),
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 37),
                    height: 180,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: AssetImage(widget.item.imagePath)
                      )
                    ),
                  ),
                  if(widget.item.discount != 0)
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.blue[700],
                            shape: BoxShape.circle),
                        child: Text('${widget.item.discount}%',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 2,
                    left: 2,
                    child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        child: IconButton(iconSize: 15,
                          icon: widget.item.isFavorite ? Icon(Icons.favorite_outlined, color: Colors.red,):Icon(Icons.favorite_outline),
                          onPressed: () {
                            setState(() {
                              widget.item.isFavorite = !widget.item.isFavorite;
                              Utilities().send("Users");
                            });
                            addRemove();
                          },)
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.item.name,
                  style: TextStyle(fontSize: 14, height: 1.5),),
                  Wrap(
                    spacing: 3,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                    Text("${widget.item.Price}R",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.blue
                      ),
                    ),
                    Text("${widget.item.originalPrice}R",
                      style: TextStyle(fontSize: 11,height: 1.5, decoration: TextDecoration.lineThrough),)
                  ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        RatingBar.builder(
                          initialRating: widget.item.rating,
                          itemSize: 12,
                          itemCount: 5,
                          allowHalfRating: true,
                          minRating: 1,
                          itemBuilder: (BuildContext context,_) =>Icon(
                            Icons.star,
                            size: 2,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (double value) {  },
                        ),
                        SizedBox(width: 5,),
                        Text('${widget.item.rating}'),
                        SizedBox(height: 5,),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
  void addRemove(){
    widget.item.isFavorite ? Data.currentUser.favorites!.add(widget.item): Data.currentUser.favorites!.remove(widget.item);
  }
}
