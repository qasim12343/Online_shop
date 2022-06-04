import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop/data/data.dart';
import 'package:shop/data/user.dart';
import 'package:shop/pages/home/home_screen.dart';
import 'package:shop/widgets/theme.dart';

void main(){
  runApp(MaterialApp(
    home: SignUp(),
    showSemanticsDebugger: false,
  ));
}

class SignUp extends  StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignUp();
  }
}


class _SignUp extends State<SignUp>{
  TextEditingController fistName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber[50],
        body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        GestureDetector(
                          child: Stack(
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 5, color: Colors.white),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: const Offset(5, 5),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.person,
                                  color: Colors.grey.shade300,
                                  size: 80.0,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
                                child: IconButton(
                                  icon:Icon(Icons.add_circle),
                                  color: Colors.grey.shade700,
                                   onPressed: () { setState(() {
                                     showDialog(context: context, builder: (BuildContext context) {
                                       return Them().alertDialog('Photo', ' ', context);
                                     },);

                                   }); },
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: fistName,
                            decoration: Them().textInputDecoration('First Name', 'Enter your first name'),
                          ),
                        ),
                        SizedBox(height: 30,),
                        Container(
                          child: TextFormField(
                            controller: lastName,
                            decoration: Them().textInputDecoration('Last Name', 'Enter your last name'),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: email,
                          decoration: Them().textInputDecoration("E-mail address", "Enter your email"),
                          keyboardType: TextInputType.emailAddress,
                          validator: (val) {
                            if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          child: TextFormField(
                            controller: phoneNumber,
                            decoration: Them().textInputDecoration(
                                "Mobile Number",
                                "Enter your mobile number"),
                            keyboardType: TextInputType.phone,
                            validator: (val) {
                              bool s = true;
                              for(int i = 0 ; i < Data.users.length; i++){
                                if(phoneNumber.value.text == Data.users[i].phoneNumber)
                                  s = false;
                              }
                              if(!(val!.isEmpty) && s &&!RegExp(r"^((\+98)|(0098)|(0))[0-9]{10}").hasMatch(val)){
                                return "Enter a valid phone number";
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        Builder(
                          builder: (context) {
                            return
                                Container(
                                  child: TextFormField(
                                    controller: this.password,
                                    obscureText: !checkboxValue,
                                    decoration: Them().textInputDecoration(
                                        "Password*", "Enter your password"),
                                    validator: (val) {
                                      if (!(val!.length > 7)) {
                                        return "Please enter your password";
                                      }
                                      return null;
                                    },
                                  ),
                                );

                          }
                        ),
                        SizedBox(height: 25),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Visible password"),
                              Checkbox(
                                  value: this.checkboxValue,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      this.checkboxValue = value??false;
                                    });
                                  }
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                      ],
                    ),
                  ),Container(
                    decoration: Them().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: Them().buttonStyle(),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                        child: Text(
                          "Register".toUpperCase(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          User user = User(
                            firstName : fistName.value.text,
                            lastName : lastName.value.text,
                            email : email.value.text,
                            password : password.value.text,
                            phoneNumber : phoneNumber.value.text,
                          );
                          if(!Data.users.contains(user)){
                            Data.users.add(user);
                            Data.currentUser = user;
                          }

                        });
                        if (_formKey.currentState!.validate()) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()
                              ),
                                  (Route<dynamic> route) => false
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text("Or create account using social media",  style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.googlePlus, size: 35,
                          color: Colors.red,),
                        onTap: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Them().alertDialog("Google Plus","You tap on GooglePlus social icon.",context);
                              },
                            );
                          });
                        },
                      ),
                      SizedBox(width: 30.0,),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 5, color: Colors.black12),
                            color: Colors.white,
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.twitter, size: 23,
                            color: Colors.blue,),
                        ),
                        onTap: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Them().alertDialog("Twitter","You tap on Twitter social icon.",context);
                              },
                            );
                          });
                        },
                      ),
                      SizedBox(width: 30.0,),
                      GestureDetector(
                        child: FaIcon(
                          FontAwesomeIcons.facebook, size: 35,
                          color: Colors.blue[700],),
                        onTap: () {
                          setState(() {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Them().alertDialog("Facebook",
                                    "You tap on Facebook social icon.",
                                    context);
                              },
                            );
                          });
                        },
                      ),
                    ],
                  ),
                ],
              )
            )
          ],
        ),
        ),
    );
  }
}

