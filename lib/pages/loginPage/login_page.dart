
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/utilities.dart';
import 'package:shop/pages/loginPage/sign_up.dart';
import 'package:shop/widgets/theme.dart';

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
  bool rightLogIn = false;
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[50],

      child: Padding(
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
                          child: Text('نماکالا',style: TextStyle(color: Colors.blue,fontSize: 20),))
                    ],
                  )
              ),
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
              // Text(Data().str),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: Them().textInputDecoration("Username","Enter your username")
                ),
              ),
              Builder(
                builder: (context) {
                  return Container(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: !visible,
                      controller: passwordController,
                      decoration: Them().textInputDecoration("Password", "Enter your password")
                    ),
                  );
                }
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Visible password"),
                    Checkbox(
                        value: visible,
                        onChanged: (bool? value) {
                          setState(() {
                            this.visible = value??false;
                          });
                        }
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    // Utilities().send("Lists");
                    // Utilities().send("Users");
                    print(Utilities().stringToObjLists(Data.listsJsonString).itemsSportClothing[0].sellerName);
                    print(Data.listsJsonString.substring(Data.listsJsonString.length-10,Data.listsJsonString.length));
                  });
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
                      for(int i = 0; i< Data.users.length; i++){
                        if(Data.users[i].firstName == nameController.value.text &&
                            Data.users[i].password == passwordController.value.text){
                          rightLogIn = true;
                          Data.currentUser = Data.users[i];
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      };
                      if(!rightLogIn)
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Them().alertDialog("Wrong inputs","Pleas try again.",context);
                          },
                        );
                      setState(() {
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
                      setState(() {
                      });
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          )),
    );
  }
}