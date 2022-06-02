import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/pages/Category/list_screen.dart';
// void main(){
//   runApp(
//       MaterialApp(
//         home:  ,
//
//   ));
// }

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
        child: Text('Add product'),
        onPressed: (){
          setState(() {

          });
        },
      ),
    );
  }
}