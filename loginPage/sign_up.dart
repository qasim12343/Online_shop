import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: SignUp(),
    showSemanticsDebugger: false,
  ));
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('NamaKala', style: TextStyle(fontSize: 30,color: Colors.red),),
                Container(
                  padding: EdgeInsets.only(top: 10),
                    child: Text('نماکالا', style: TextStyle(fontSize: 20,color: Colors.black),)),
              ],
            ),
            SizedBox(height: 20,),
            Container(
              child: Image.asset('assets/icons/transfer.svg'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black26,blurRadius: 3)
                  ]
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: 300,
              child: Column(
                children: [
                  Text("Username"),
                  SizedBox(height: 4,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      style: TextStyle(
                        shadows: [BoxShadow(color: Colors.blue)]
                      ),
                      decoration: InputDecoration(
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
