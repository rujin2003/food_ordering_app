import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:quiver/iterables.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';

class addCart extends ChangeNotifier {
  List ola = [];
  int total = 0;
  String? adress;
  //main user data of the app
  Map Userprofile = {'email': '', 'phoneno': '', 'username': '', 'adress': ''};
// to add item in the cart

  addtocart(product, img, price, quantity) {
    ola.add(
        {'name': product, 'img': img, 'price': price, 'quantity': quantity});
    notifyListeners();
  }

//to remove a cart item
  removeitem(index, price) {
    total = (total - ola[index]['price'] * ola[index]['quantity']) as int;
    ola.remove(ola[index]);
    notifyListeners();
  }

//to calculate the total in the cart page
  totalclac() {
    var counter = 0;
    for (final i in range(0, ola.length)) {
      counter = ola[i.toInt()]['price'] * ola[i.toInt()]['quantity'] + counter;
      total = counter;
      notifyListeners();
    }
  }

//to update the data
  updatedatalocation(adress) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({'adress': adress});
    Userprofile.update('adress', (value) => adress);

    notifyListeners();
  }

  //update username
  updatefields(text1, text2) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.email)
        .update({text1: text2});

    Userprofile.update(text1, (value) => text2);
    notifyListeners();
  }

//to get the user data but not working
  Future getuserProfile() async {
    var response = await FirebaseFirestore.instance
        .collection('Users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
    Userprofile['email'] = response.docs[0]['email'];
    Userprofile['phoneno'] = response.docs[0]['phoneno'];
    Userprofile['username'] = response.docs[0]['username'];
    Userprofile['adress'] = response.docs[0]['adress'];
  }

//to insure the quantites and prices
  refreshtotoalAdd(
    int price,
  ) {
    total = total + price;
  }

  refreshtotoalSub(int price) {
    total = total - price;
  }

  addquantity(int index) {
    ola[index]['quantity'] = ola[index]['quantity'] + 1;
    notifyListeners();
  }

  substractquantity(int index) {
    ola[index]['quantity'] = ola[index]['quantity'] - 1;
    notifyListeners();
  }

  //to get the current adress of the user

  shoopingadress() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Fluttertoast.showToast(msg: 'please keep your location on');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: 'Location permession denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: 'location permission denied forever');
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      adress = "${place.street}," +
          "${place.locality}," +
          "${place.postalCode}," +
          "${place.country}";
      updatedatalocation(adress); //uodate in the data base
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  //adding the order in the cart

  checkoutcart() {
    try {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(Userprofile['email'])
          .collection('Order')
          .doc()
          .set({'order': FieldValue.arrayUnion(ola)});
      ola = [];
      total = 0;
      notifyListeners();
    } catch (e) {
      print(e.toString());
    }
  }
}
