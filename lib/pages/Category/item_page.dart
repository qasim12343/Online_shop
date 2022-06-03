import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/item.dart';
import 'package:shop/widgets/theme.dart';

class ItemPage extends StatefulWidget {
  Item item;
  ItemPage({Key? key, required this.item}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool colorSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.item.name,
                      style: TextStyle(fontSize: 25, height: 1.4),),
                    SizedBox(height: 10,),
                    Wrap(
                      spacing: 3,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text("${widget.item.Price}R",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.blue
                          ),
                        ),
                        Text("${widget.item.originalPrice}R",
                          style: TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough),)
                      ],
                    ),
                    Container(
                      height: 40,
                      child: Row(
                        children: [
                          RatingBar.builder(
                            initialRating: widget.item.rating,
                            itemSize: 20,
                            itemCount: 5,
                            allowHalfRating: true,
                            minRating: 1,
                            itemBuilder: (BuildContext context,_) =>Icon(
                              Icons.star,
                              size: 4,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {  },
                          ),
                          SizedBox(width: 5,),
                          Text('${widget.item.rating}',style: TextStyle(fontSize: 25),),
                          SizedBox(height: 5,),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),

                    Builder(
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(7),
                            child: !widget.item.isMine ?ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Data.numberOfItemsInCart++;
                                    Data.currentUser.purcheses!.add(widget.item);
                                    widget.item.isMine = true;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Buy",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Icon(Icons.add_shopping_cart),
                                  ],
                                )
                            ):ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    Data.numberOfItemsInCart--;
                                    Data.currentUser.purcheses!.remove(widget.item);
                                    widget.item.isMine = false;
                                  });
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Remove",style: TextStyle(fontWeight: FontWeight.bold),),
                                    Icon(Icons.delete_outline_rounded),
                                  ],
                                )
                            ),
                          );
                        }
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
