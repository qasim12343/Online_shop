import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/item.dart';
import 'package:shop/data/utilities.dart';
import 'package:shop/pages/Category/list_screen.dart';
import 'package:shop/widgets/my_colors.dart';
import '../../widgets/theme.dart';

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
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AddProducts()));
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
  Item ?newProduct;
  TextEditingController name = TextEditingController();
  TextEditingController discount = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController rating = TextEditingController();
  TextEditingController imagePath = TextEditingController();

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
        leading: Container(
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () { 
              setState(() {
                Navigator.pushReplacementNamed(context, '/myProducts');
              });
            },
            
          ),
        ),
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
                                      listTile(discount, '', 'Discount', ''),
                                      SizedBox(height: 10,),
                                      listTile(rating, '', 'Rating', ''),
                                      SizedBox(height: 10,),
                                      listTile(imagePath, '', 'imagePath', ''),
                                      SizedBox(height: 10,),
                                      Text('Colors'),
                                      MyColorList(colors: [Colors.white, Colors.red,Colors.blue,Colors.black,
                                        Colors.green, Colors.amber, Colors.orange,Colors.deepPurple]),
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 35,
                                        child: InkWell(
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Select Category', style: TextStyle(fontSize:20)),
                                              Icon(Icons.arrow_forward),
                                            ],
                                          ),
                                          onTap: (){
                                            setState(() {
                                              showModalBottomSheet(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(9),
                                                        topRight: Radius.circular(9),
                                                      )
                                                  ),
                                                  context: context,
                                                  builder: (BuildContext bc){
                                                    return BottomCategorySheet();
                                                  }
                                              );
                                              //
                                              // Utilities().send("Lists");
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
                            onPressed: (){
                              newProduct = Item(name: name.text, imagePath: imagePath.text,
                                  discount: int.parse(discount.text), originalPrice: double.parse(price.text), rating: double.parse(rating.text));
                              setState(() {

                                Data.currentUser.myProducts!.add(newProduct!);
                                int index = Data.users.indexOf(Data.currentUser);
                                Data.users[index] = Data.currentUser;
                                Utilities().send("Users");
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyProducts()));
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
class BottomCategorySheet extends StatefulWidget {
  const BottomCategorySheet({Key? key}) : super(key: key);

  @override
  State<BottomCategorySheet> createState() => _BottomCategorySheetState();
}

class _BottomCategorySheetState extends State<BottomCategorySheet> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.all(4),
                    child: InkWell(
                      child: Icon(Icons.close),
                      onTap: (){
                        Navigator.pushReplacementNamed(context,'/home');
                      },
                    ),
                  ),
                  Text('Filter',textAlign: TextAlign.center,),
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Text('Reset',textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue),),
                      onTap: (){
                      },
                    ),
                  )
                ]
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20,),
              child: Text('Select category', style: TextStyle(fontSize: 20),),
            ),
            FilterCategoryList(names: [
                "Clothing - Men","Clothing - Women","Clothing - Kids",
                "Digital - Phone","Digital - Cameras","Digital - Computer",
                'Book - Music','Book - Book','Book - Stationary',
                'Sport - SportClothing','Sport - SportEquipments','Sport - Travel',
            ]),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Apply')),
            )
          ],
        ),
      ),
    );
  }
}
class FilterCategoryList extends StatefulWidget {
  List<String> names;
  FilterCategoryList({Key? key, required this.names}) : super(key: key);

  @override
  State<FilterCategoryList> createState() => _FilterCategoryListState();
}

class _FilterCategoryListState extends State<FilterCategoryList> {

  @override

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            // shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(200)
          ),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: widget.names.length,
              itemBuilder: (context, index){
                return ACategory(name: widget.names[index]);
              }),
        )
    );
  }
}
class ACategory extends StatefulWidget {
  bool isSelected ;
  String name;
  ACategory({Key? key,this.isSelected = false , required this.name}) : super(key: key);

  @override
  State<ACategory> createState() => _ACategoryState();
}

class _ACategoryState extends State<ACategory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('------------------------------------'),
        SizedBox(
          height: 30,
          child: InkWell(
            onTap: (){
              setState(() {
                widget.isSelected = !widget.isSelected;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.name,
                style: TextStyle(fontSize: 17),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: widget.isSelected ? Icon(Icons.add_task):null
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}