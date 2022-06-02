import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shop/data/item.dart';
import 'package:shop/pages/Category/widgets/header_sliver.dart';
import 'package:shop/widgets/app_bottom_navigation.dart';

class ListScreen extends StatefulWidget {
  String title;
  List<Item> items;
  ListScreen({Key? key, required this.items, required this.title}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AppBarBottomNavigation(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              pinned: true,
              floating: true,
                delegate: HeaderSliver(maxExtent: 120, minExtent: 120, title: widget.title),
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
class GridItem extends StatelessWidget {
  final Item item;
  const GridItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                        image: AssetImage(item.imagePath)
                    )
                  ),
                ),
                if(item.discount != 0)
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
                      child: Text('${item.discount}%',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
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
                Text(item.name,
                style: TextStyle(fontSize: 14, height: 1.5),),
                Wrap(
                  spacing: 3,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                  Text("${item.Price}R",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.blue
                    ),
                  ),
                  Text("${item.originalPrice}R",
                    style: TextStyle(fontSize: 11,height: 1.5, decoration: TextDecoration.lineThrough),)
                ],
                ),
                Container(
                  child: Row(
                    children: [
                      RatingBar.builder(
                        initialRating: item.rating,
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
                      Text('${item.rating}')
                    ],
                  ),
                )
              ],
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.add))
        ],
      ),
    );
  }
}
