// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'package:mrfoodiee/functions/datahandling.dart';

import 'package:mrfoodiee/pagess/loginpage.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import '../functions/dimensions.dart';
import '../functions/shooping.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  bool editstatePhone = false;
  bool editstateEmail = false;
  TextEditingController editPhone = TextEditingController();
  TextEditingController editEmail = TextEditingController();
  final storage = FlutterSecureStorage();
  @override
  final currentuser = FirebaseAuth.instance;
  Datahandle data = Datahandle();

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.email);
    return FutureBuilder(
      future: Provider.of<addCart>(context).getuserProfile(),
      builder: ((context, snapshot) => Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight,
                        Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 350)),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'images/profilepagebackground.jpg',
                            ),
                            fit: BoxFit.cover)),
                  )),
              Positioned(
                  top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 280),
                  left: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 47),
                  child: Container(
                    height: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 400),
                    width: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 330),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffDDDDDD),
                            blurRadius: 6.0,
                            spreadRadius: 2.0,
                            offset: Offset(0.0, 0.0),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 40),
                          ),
                          Text(
                              Provider.of<addCart>(context)
                                  .Userprofile['username'],
                              style: TextStyle(
                                  fontSize:
                                      Dimensions.Static_margins_and_paddings(
                                          Dimensions.screenheight, 20),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 30),
                          ),
                          Divider(
                            color: Colors.grey,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 10),
                                  ),
                                  Text(
                                    'Mobile Number: ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Dimensions
                                            .Static_margins_and_paddings(
                                                Dimensions.screenheight, 16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 10),
                                  ),
                                  editstatePhone == false
                                      ? Text(
                                          Provider.of<addCart>(context)
                                              .Userprofile['phoneno'],
                                          style: TextStyle(
                                              fontSize: Dimensions
                                                  .Static_margins_and_paddings(
                                                      Dimensions.screenheight,
                                                      16)),
                                        )
                                      : Container(
                                          width: Dimensions
                                              .Static_margins_and_paddings(
                                                  Dimensions.screenheight, 210),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              hintText: 'Phoenum...',
                                            ),
                                            controller: editPhone,
                                          ),
                                        ),
                                  SizedBox(
                                    width:
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 10),
                                  ),
                                  editstatePhone == false
                                      ? IconButton(
                                          onPressed: (() {
                                            setState(() {
                                              editstatePhone = true;
                                            });
                                          }),
                                          icon: Icon(
                                            Icons.edit,
                                            color: Color.fromRGBO(
                                                156, 39, 176, 100),
                                          ),
                                        )
                                      : Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    editstatePhone = false;
                                                  });
                                                },
                                                icon: Icon(Icons.cancel)),
                                            IconButton(
                                              onPressed: (() {
                                                setState(() {
                                                  Provider.of<addCart>(context,
                                                          listen: false)
                                                      .updatefields('username',
                                                          editPhone.text);
                                                  editstatePhone = false;
                                                });
                                              }),
                                              icon:
                                                  Icon(Icons.archive_outlined),
                                              color: Colors.lightGreen,
                                            ),
                                          ],
                                        )
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 10),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 10),
                                  ),
                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Dimensions
                                            .Static_margins_and_paddings(
                                                Dimensions.screenheight, 16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 10),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 10),
                                  ),
                                  editstateEmail == false
                                      ? Text(
                                          Provider.of<addCart>(context)
                                              .Userprofile['email'],
                                          style: TextStyle(
                                              fontSize: Dimensions
                                                  .Static_margins_and_paddings(
                                                      Dimensions.screenheight,
                                                      16)),
                                        )
                                      : Container(
                                          width: Dimensions
                                              .Static_margins_and_paddings(
                                                  Dimensions.screenheight, 210),
                                          child: TextField(
                                            decoration: InputDecoration(
                                                hintText: 'Email...',
                                                border: null),
                                            controller: editEmail,
                                          ),
                                        ),
                                  editstateEmail == false
                                      ? IconButton(
                                          onPressed: (() {
                                            setState(() {
                                              editstateEmail = true;
                                            });
                                          }),
                                          icon: Icon(
                                            Icons.edit,
                                            color: Color.fromRGBO(
                                                156, 39, 176, 100),
                                          ),
                                        )
                                      : Row(
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    editstateEmail = false;
                                                  });
                                                },
                                                icon: Icon(Icons.cancel)),
                                            IconButton(
                                              onPressed: (() {
                                                setState(() {
                                                  Provider.of<addCart>(context,
                                                          listen: false)
                                                      .updatefields('email',
                                                          editEmail.text);
                                                  editstateEmail = false;
                                                });
                                              }),
                                              icon:
                                                  Icon(Icons.archive_outlined),
                                              color: Colors.lightGreen,
                                            ),
                                          ],
                                        )
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 10),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 10),
                                  ),
                                  Text(
                                    "Adress",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: Dimensions
                                            .Static_margins_and_paddings(
                                                Dimensions.screenheight, 16)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 10),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 10),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        adressWidget(context);
                                      },
                                      child: Text(
                                        Provider.of<addCart>(context)
                                                    .Userprofile['adress'] ==
                                                'add_adress'
                                            ? 'add_adress'
                                            : Provider.of<addCart>(context)
                                                .Userprofile['adress'],
                                        style: TextStyle(
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: Dimensions
                                                .Static_margins_and_paddings(
                                                    Dimensions.screenheight,
                                                    16)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 20),
                                    ),
                                    Icon(
                                      Icons.location_on,
                                      color: Color.fromRGBO(19, 141, 117, 100),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 10),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 210),
                  left: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 165),
                  child: Container(
                    height: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 95),
                    width: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 95),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: const Color.fromRGBO(255, 255, 255, 40)),
                    child: Icon(
                      Icons.account_circle,
                      size: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 60),
                    ),
                  )),
              Positioned(
                  top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 280),
                  left: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 320),
                  child: Container(
                    child: IconButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          await storage.delete(key: 'email');
                          Get.to(Firstpagewelcome());
                        },
                        icon: Icon(
                          Icons.logout_outlined,
                          size: 27,
                        )),
                  ))
            ],
          )),
    );
  }
}

Future adressWidget(context) {
  return showDialog(
    context: context,
    builder: ((context) => AlertDialog(
        title: Text('About'),
        content: Container(
            height: 150,
            width: 100,
            child: Column(
              children: [
                Text(
                  'This feature automatically detects your lat. and long. position please make sure to turn on your location on device',
                  style: TextStyle(color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: (() async {
                          await Provider.of<addCart>(context, listen: false)
                              .shoopingadress();
                        }),
                        child: Text(
                          'Ok',
                          style: TextStyle(color: Colors.blue),
                        )),
                    SizedBox(
                      width: 10,
                    )
                  ],
                )
              ],
            )))),
  );
}
