// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/functions/shooping.dart';
import 'package:mrfoodiee/pagess/menu/menu.dart';
import 'package:provider/provider.dart';

import '../functions/datahandling.dart';
import 'Profile_page.dart';
import 'cart.dart';
import 'home.dart';
import 'signuppage.dart';

class MainPagelistpage extends StatefulWidget {
  const MainPagelistpage({
    super.key,
  });

  @override
  State<MainPagelistpage> createState() => _MainPagelistpageState();
}

class _MainPagelistpageState extends State<MainPagelistpage> {
  int current_index = 0;
  var pages = [Homepage(), Menu(), Cart(), Profilepage()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: IndexedStack(
        index: current_index,
        children: pages,
      ),
      // bottomnavigation bar
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: current_index,
          showSelectedLabels: false,
          onTap: (index) => setState(() => current_index = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.food_bank,
                  color: Colors.black,
                ),
                label: "menu"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
                label: "cart"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black,
                ),
                label: "profile"),
          ]),

      //indexed stack
    ));
  }
}
