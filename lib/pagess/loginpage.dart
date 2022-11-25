// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/functions/datahandling.dart';

import 'package:mrfoodiee/functions/dimensions.dart';
import 'package:mrfoodiee/pagess/signuppage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Firstpagewelcome extends StatefulWidget {
  const Firstpagewelcome({super.key});

  @override
  State<Firstpagewelcome> createState() => _FirstpagewelcomeState();
}

class _FirstpagewelcomeState extends State<Firstpagewelcome> {
  Datahandle login = Datahandle();
  TextEditingController emailtxt = TextEditingController();
  TextEditingController passwordtxt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    children: <Widget>[
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
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      Dimensions.Static_margins_and_paddings(
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
                          Dimensions.screenheight, 30)),
                  child: Column(
                    children: <Widget>[
                      Container(
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(
                                  Dimensions.Static_margins_and_paddings(
                                      Dimensions.screenheight, 8)),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey[100]!))),
                              child: TextField(
                                controller: emailtxt,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email ",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(
                                  Dimensions.Static_margins_and_paddings(
                                      Dimensions.screenheight, 8)),
                              child: TextField(
                                controller: passwordtxt,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle:
                                        TextStyle(color: Colors.grey[400])),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 30),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromRGBO(143, 148, 251, .6))),
                        onPressed: (() {
                          login.login(emailtxt.text.trim(),
                              passwordtxt.text.trim(), context);
                        }),
                        child: Container(
                          height: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color.fromRGBO(143, 148, 251, .6)),
                          child: Center(
                            child: Text(
                              "Login",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromRGBO(143, 148, 251, 1))),
                          SizedBox(
                            width: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 10),
                          ),
                          GestureDetector(
                            onTap: (() {
                              Get.to(signup());
                            }),
                            child: Text("Signup",
                                style: TextStyle(
                                    color: Color.fromRGBO(143, 148, 251, 1))),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
