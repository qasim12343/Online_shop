import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getData() async{
    await Future.delayed(Duration(seconds: 10));
    Navigator.pushNamed(context, '/home');
  }

  @override
  void initState() {
    super.initState();
    getData();
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
