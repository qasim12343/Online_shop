import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/utilities.dart';

import 'loginPage/login_page.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

   _LoadingState(){
    new Timer(const Duration(milliseconds: 2000), (){
      setState(() {
        Utilities().get();
        Utilities().todo();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('NamaKala',style: TextStyle(fontSize: 40, color: Colors.red),),
              SizedBox(width: 2,),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text('نماکالا',style: TextStyle(fontSize: 20),),
              )
            ],),
            SizedBox(height: 20,),
            SpinKitSpinningLines(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      )
    );
  }
}
