// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/functions/datahandling.dart';

import '../functions/dimensions.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  bool isloading = false;
  Datahandle signup = Datahandle();
  TextEditingController emailtxt = TextEditingController();
  TextEditingController usernametxt = TextEditingController();
  TextEditingController phonenotxt = TextEditingController();
  TextEditingController passwordtxt = TextEditingController();
  TextEditingController confirmpasstxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return isloading == false
        ? Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: Dimensions.screenheight,
                child: Column(
                  children: [
                    Container(
                      height: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 400),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/background.png'),
                              fit: BoxFit.fill)),
                      child: Stack(
                        children: [
                          Positioned(
                            left: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 30),
                            width: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 80),
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 200),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/light-1.png'))),
                            ),
                          ),
                          Positioned(
                            left: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 140),
                            width: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 80),
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 150),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/light-2.png'))),
                            ),
                          ),
                          Positioned(
                            right: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 40),
                            top: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 40),
                            width: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 80),
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 150),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('images/clock.png'))),
                            ),
                          ),
                          Positioned(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.Static_margins_and_paddings(
                                      Dimensions.screenheight, 50)),
                              child: Center(
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 40),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(
                          Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 10)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 280),
                            padding: EdgeInsets.all(
                                Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 5)),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 7)),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]!))),
                                    child: TextField(
                                      controller: emailtxt,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email Adress",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 7)),
                                    child: TextField(
                                      controller: usernametxt,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Username",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 7)),
                                    child: TextField(
                                      controller: phonenotxt,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "phone no",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 7)),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]!))),
                                    child: TextField(
                                      controller: passwordtxt,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 7)),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]!))),
                                    child: TextField(
                                      controller: confirmpasstxt,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Confirm password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 30),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(
                                  143, 148, 251, 1), // Background color
                            ),
                            onPressed: () {
                              signup.signup(
                                  emailtxt.text.trim(),
                                  phonenotxt.text.trim(),
                                  usernametxt.text.trim(),
                                  passwordtxt.text.trim(),
                                  confirmpasstxt.text.trim());
                              setState(() {
                                isloading = true;
                              });

                              Future.delayed(Duration(seconds: 3), () {
                                setState(() {
                                  isloading = false;
                                });
                                Get.back();
                              });
                            },
                            child: Container(
                              height: Dimensions.Static_margins_and_paddings(
                                  Dimensions.screenheight, 50),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(colors: [
                                    Color.fromRGBO(143, 148, 251, 1),
                                    Color.fromRGBO(143, 148, 251, .6),
                                  ])),
                              child: Center(
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 70),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
        : Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
  }
}
