import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/item.dart';
import 'package:shop/data/utilities.dart';

class ItemPage extends StatefulWidget {
  Item item;
  ItemPage({Key? key, required this.item}) : super(key: key);

  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  bool colorSelected = false;
  bool colorSelected2 = false;
  bool colorSelected3 = false;
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
                    Positioned(
                      top: 10,
                      left: 11,
                      child: Container(
                        alignment: Alignment.center,
                        height: 60,
                        width: 60,
                        child: IconButton(iconSize: 15,
                          icon: SvgPicture.asset('assets/icons/back.svg',),
                          onPressed: () { Navigator.pop(context); },)
                        ),
                      ),
                  ],
                ),
              ),
              Container(
                color: Colors.lightBlue[50],
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
                    Text("-------------------------------------------"),
                    Row(children: [
                      Text("Seller : ", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10,),
                      Text(widget.item.sellerName, style: TextStyle(fontSize: 20),)
                    ],),
                    SizedBox(height: 10,),
                    Row(children: [
                      Text("Number of Exist : ", style: TextStyle(fontSize: 16)),
                      SizedBox(width: 10,),
                      Text('${widget.item.count}', style: TextStyle(fontSize: 20),)
                    ],),
                    SizedBox(height: 20,),
                    Center(child: Text('Colors',style: TextStyle(fontSize:25),)),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              colorSelected = !colorSelected;
                              colorSelected3 = false;
                              colorSelected2 = false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3)],
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            height: 40,
                            width: 40,
                            child:
                            Center(child: colorSelected ? SvgPicture.asset('assets/icons/tick.svg'):null),
                          ),
                        ),
                          SizedBox(width: 12,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                colorSelected3 = !colorSelected3;
                                colorSelected = false;
                                colorSelected2 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3)],
                                shape: BoxShape.circle,
                                color: Colors.blueGrey,
                              ),
                              height: 40,
                              width: 40,
                              child:
                              Center(child: colorSelected3 ? SvgPicture.asset('assets/icons/tick.svg'):null),
                            ),
                          ),
                          SizedBox(width: 12,),
                          InkWell(
                            onTap: (){
                              setState(() {
                                colorSelected2 = !colorSelected2;
                                colorSelected = false;
                                colorSelected3 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3)],
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                              height: 40,
                              width: 40,
                              child:
                              Center(child: colorSelected2 ? SvgPicture.asset('assets/icons/tick.svg'):null),
                            ),
                          ),

                      ],
                      ),
                    ),
                    Builder(
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(7),
                            child: !widget.item.isMine ?ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    widget.item.count --;
                                    Data.numberOfItemsInCart++;
                                    Data.currentUser.purchases!.add(widget.item);
                                    widget.item.isMine = true;
                                    Utilities().send('Users');
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
                                    widget.item.count ++;
                                    Data.currentUser.purchases!.remove(widget.item);
                                    widget.item.isMine = false;
                                    Utilities().send("Users");
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
