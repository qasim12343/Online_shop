
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
          children: [
            Container(
            child: Stack(
            children: [
              ClipPath(
              child: Container(
                decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  colors: [
                    Theme.of(context).primaryColor.withOpacity(0.4),
                    Theme.of(context).accentColor.withOpacity(0.4),
                    ],
                    tileMode: TileMode.clamp
                ),
                ),
              ),
              ),
            ]),
            ), //
          ],
        ),
      ),
    );
  }
}