import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/user.dart';
import 'package:shop/data/utilities.dart';
import 'package:shop/pages/home/home_screen.dart';
import 'package:shop/pages/loginPage/login_page.dart';

import '../widgets/theme.dart';
import 'Category/list_screen.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({Key? key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage>{
  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
                });
              },
            )
        ),
        title: Text("Profile Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),

        iconTheme: IconThemeData(color: Colors.white),
        flexibleSpace:Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Theme.of(context).primaryColor, Theme.of(context).dividerColor,]
              )
          ),
        ),

      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(height: 100, color: Colors.blueAccent,),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/pf.jpg',),
                      ),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 5, color: Colors.white),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 20, offset: const Offset(5, 5),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(Data.currentUser.firstName+' '+Data.currentUser.lastName, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
                  SizedBox(height: 20,),
                  SizedBox(height: 10,),
                  Container(
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (context)=>ListScreen(
                                      items: Data.currentUser.favorites!,
                                      title: 'Favorites',isFavoritePage: true,)));
                          },
                          splashColor: Colors.blue,
                          child: Container(
                            padding: const EdgeInsets.only(left: 10, top: 7),
                            height: 45,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7),
                              boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 0.1, blurRadius: 0.5)]
                              
                            ),
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Icon(Icons.favorite,color: Colors.red,),
                                SizedBox(width: 20,),
                                Text(
                                  "Favorite List",
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                                SizedBox(width: 125,),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 4.0,top: 20),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "User Information",
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
                                        ListTile(
                                          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                          leading: Icon(Icons.person),
                                          subtitle:  Container(
                                            child: TextFormField(
                                              controller: userName,
                                              decoration: Them().textInputDecoration(Data.currentUser.firstName, 'Enter your UserName'),
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.email),
                                          subtitle: Container(
                                              child: TextFormField(
                                                controller: email,
                                                decoration: Them().textInputDecoration(Data.currentUser.email, "Enter your email"),
                                                keyboardType: TextInputType.emailAddress,
                                                validator: (val) {
                                                  if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                                                    return "Enter a valid email address";
                                                  }
                                                  return null;
                                                },
                                              ),
                                            ),
                                        ),
                                        ListTile(
                                          leading: Icon(Icons.phone),
                                          subtitle: Container(
                                            child: TextFormField(
                                              controller: phoneNumber,
                                              decoration: Them().textInputDecoration( Data.currentUser.phoneNumber,"Mobile Number",),
                                              keyboardType: TextInputType.phone,
                                              validator: (val) {
                                                if(!(val!.isEmpty) && !RegExp(r"^((\+98)|(0098)|(0))[0-9]{10}").hasMatch(val)){
                                                  return "Enter a valid phone number";
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        ListTile(
                                          leading: Text("Password"),
                                          subtitle: Builder(
                                            builder: (context) {
                                              return Container(
                                                child: Column(
                                                  children: [
                                                    TextFormField(
                                                      controller: password,
                                                      obscureText: !visible,
                                                      decoration: Them().textInputDecoration('*******',"Enter your new password"),
                                                      validator: (val){
                                                        if(!(val!.length > 7)){
                                                          return "Enter at least 8 character";
                                                        }
                                                        else
                                                          return null;
                                                      },
                                                      ),
                                                    Container(
                                                      width: 200,
                                                      padding: EdgeInsets.all(7),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                        Text("visible"),
                                                        Checkbox(
                                                            value: visible,
                                                            onChanged: (bool?value){
                                                              setState(() {
                                                                visible = value??false;
                                                              });
                                                            })
                                                      ],),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 150,
                                  decoration: Them().buttonBoxDecoration(context),
                                  child: TextButton(
                                    onPressed: (){
                                      setState(() {
                                        int index = Data.users.indexOf(Data.currentUser);
                                        Data.currentUser.firstName = userName.text != ''? userName.text: Data.currentUser.firstName;
                                        Data.currentUser.password = password.text != ''? password.text: Data.currentUser.password;
                                        Data.currentUser.email = email.text != ''? email.text: Data.currentUser.email;
                                        Data.currentUser.phoneNumber = phoneNumber.text != ''? phoneNumber.text: Data.currentUser.phoneNumber;
                                        Data.users[index] = Data.currentUser;
                                      });
                                      Utilities().send("Users");
                                    },
                                    child: Text("Apply changes",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 325,
                          decoration: Them().buttonBoxDecoration(context),
                          child: TextButton(
                            onPressed: (){setState(() {
                              Utilities().send("Users");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginPage()));
                            });
                            },
                            child: Text("Log out",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
