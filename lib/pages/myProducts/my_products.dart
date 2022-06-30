import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/item.dart';
import 'package:shop/data/utilities.dart';
import 'package:shop/pages/Category/list_screen.dart';
import 'package:shop/pages/Category/widgets/filter_list.dart';
import 'package:shop/widgets/my_colors.dart';

import '../../widgets/theme.dart';
import '../Category/widgets/filter_modal_bottom_sheet.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({Key? key}) : super(key: key);

  @override
  _MyProductsState createState() => _MyProductsState();
}

class _MyProductsState extends State<MyProducts> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListScreen(items: Data.currentUser.myProducts!, title: 'My Products'),
      floatingActionButton: FloatingActionButton(
        child: Text('Add'),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProducts()));
        },
      ),
    );
  }
}

class AddProducts extends StatefulWidget {

  const AddProducts({Key? key}) : super(key: key);

  @override
  _AddProductsState createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  TextEditingController name = TextEditingController();
  TextEditingController details = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController colors = TextEditingController();
  TextEditingController category = TextEditingController();

  ListTile listTile(
      TextEditingController input,
      String hint,
      String label,
      String notValid,
      ){
    return  ListTile(
      subtitle: Builder(
          builder: (context) {
            return Container(
              child: Column(
                children: [
                  TextFormField(
                    controller: input,
                    decoration: Them().textInputDecoration(label,hint),
                    validator: (val){
                      if(!(val!.isEmpty)){
                        return notValid;
                      }
                      else
                        return null;
                    },
                  ),
                ],
              ),
            );
          }
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register your product"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    children: [Container(
                      height: 200,
                      width: 300,
                      decoration: BoxDecoration(

                        shape: BoxShape.rectangle,
                      ),
                      child: Center(child: Text('Add photo of product',style: TextStyle(color: Colors.blue),))
                    ),
                      Positioned(
                        bottom: 20,
                        right: 125,
                        child: IconButton(
                          onPressed: (){
                            setState(() {
                              Them().alertDialog('Choose Photo', 'add photo', context);
                            });
                          },
                           icon:Icon(Icons.add,size: 40.0,),
                      ))
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Product Information",
                          style: TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Card(
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  ...ListTile.divideTiles(
                                    color: Colors.grey,
                                    tiles: [
                                      listTile(name, "", 'Enter your name of product', 'Enter valid name'),
                                      SizedBox(height: 10,),
                                      listTile(price, '', 'Enter your price', 'Empty'),
                                      SizedBox(height: 10,),
                                      listTile(details, '', 'Add more details', ''),
                                      SizedBox(height: 10,),
                                      Text('Colors'),
                                      MyColorList(colors: [Colors.white, Colors.red,Colors.blue,Colors.black,
                                        Colors.green, Colors.amber, Colors.orange,Colors.deepPurple]),
                                      SizedBox(height: 10,),
                                      listTile(category, '', 'Enter category of your product', 'No category added'),
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 35,
                                        child: InkWell(
                                          child:Text('click'),
                                          onTap: (){
                                            setState(() {
                                              Utilities().send("Users");
                                              Utilities().send("Lists");
                                            });
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        decoration: Them().buttonBoxDecoration(context),
                        child: TextButton(
                            onPressed: (){setState(() {
                              Data.currentUser.myProducts!.add(Item(
                                name: name.value.text,
                                imagePath: '', rating: 0, discount: 0, originalPrice: price.value.text as double,

                              ));
                            });
                            },
                            child: Text("Add",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                        ),
                      )
                    ],
                  ),
                ),
              ]
            ),
        ),
      ),
    );
  }
}