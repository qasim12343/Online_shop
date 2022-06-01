
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/fake.dart';
import 'package:shop/data/fake.dart';
import 'package:shop/pages/loginPage/sign_up.dart';
import 'package:shop/pages/loginPage/widget/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Fake fake = Fake();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'NamaKala',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 20),
                        child: Text('نماکالا',style: TextStyle(color: Colors.white,fontSize: 20),))
                  ],
                )),
            SizedBox(height: 40,),
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5),]
              ),
              child: Icon(Icons.login,),
            ),
            SizedBox(height: 40,),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: Them().textInputDecoration("Username","Enter your username")
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: Them().textInputDecoration("Password", "Enter your password")
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text('Forgot Password',),
              style: Them().buttonStyle(),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login',style: TextStyle(color: Colors.blue),),
                  onPressed: () {
                    for(int i = 0; i< fake.getUsers().length; i++){
                      if(fake.getUsers()[i].firstName+" "+fake.getUsers()[i].lastName == nameController.toString() &&
                      fake.getUsers()[i].password == passwordController.toString()){
                      Navigator.pushNamed(context, '/home');
                      }
                    };
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Them().alertDialog("Google Plus","You tap on GooglePlus social icon.",context);
                        },
                      );
                    });
                  },
                  style: Them().buttonStyle(),
                ),
            ),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}