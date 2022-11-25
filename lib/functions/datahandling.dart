// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/pagess/pagelist_page.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Datahandle {
  final storage = FlutterSecureStorage();
  //signs'up and stores the user data to firebase collection User
  void signup(email, phoneno, username, password, confirmpass) async {
    if (confirmpass == password) {
      var result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      Map<String, String> usermap = {
        "email": email,
        "username": username,
        'phoneno': phoneno,
        "password": password,
        'adress': 'add_adress'
      };
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set(usermap);

      //store data in firestore
    }
  }

//to login to the page
  Future login(email, password, context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (await FirebaseAuth.instance.currentUser != null) {
        Get.off(() => MainPagelistpage());
        await storage.write(
            key: 'email', value: FirebaseAuth.instance.currentUser!.email);
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text('Error'),
                content: Container(
                  height: 100,
                  width: 100,
                  child: Column(
                    children: [
                      Text('invalid email or password'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                              onPressed: (() {
                                Navigator.pop(context);
                              }),
                              child: Text('Ok')),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )));
    }
  }
}
