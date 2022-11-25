// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/pagess/foodpage_body.dart';
import 'package:mrfoodiee/pagess/menu/starter.dart';

import '../../functions/dimensions.dart';
import '../home.dart';
import 'desert.dart';
import 'maincourse.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final pages = [Starter(), Maincourse(), Desert()];
  PageController _controller = PageController(initialPage: 0);
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            decoration:
                BoxDecoration(color: Color.fromRGBO(247, 249, 249, 100)),
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 35),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 25),
                    ),
                    Text(
                      'Our menu',
                      style: TextStyle(
                          fontSize: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                            right: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 25)),
                        child: Icon(Icons.shopping_cart_checkout_outlined))
                  ],
                ),
                SizedBox(
                  height: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 40),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 100),
                        height: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: currentindex == 0
                                ? Colors.white
                                : Color.fromRGBO(247, 249, 249, 100)),
                        child: Center(
                          child: Text(
                            'Starter',
                            style: TextStyle(
                                fontSize:
                                    Dimensions.Static_margins_and_paddings(
                                        Dimensions.screenheight, 16),
                                color: currentindex == 0
                                    ? Color.fromRGBO(0, 188, 212, 100)
                                    : Colors.black,
                                decoration: currentindex == 0
                                    ? TextDecoration.underline
                                    : TextDecoration.none),
                          ),
                        ),
                      ),
                      Container(
                        width: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 100),
                        height: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: currentindex == 1
                                ? Colors.white
                                : Color.fromRGBO(247, 249, 249, 100)),
                        child: Center(
                          child: Text('Main course',
                              style: TextStyle(
                                  fontSize:
                                      Dimensions.Static_margins_and_paddings(
                                          Dimensions.screenheight, 16),
                                  color: currentindex == 1
                                      ? Color.fromRGBO(0, 188, 212, 100)
                                      : Colors.black,
                                  decoration: currentindex == 1
                                      ? TextDecoration.underline
                                      : TextDecoration.none)),
                        ),
                      ),
                      Container(
                        width: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 100),
                        height: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: currentindex == 2
                                ? Colors.white
                                : Color.fromRGBO(247, 249, 249, 100)),
                        child: Center(
                          child: Text('Desert',
                              style: TextStyle(
                                  fontSize:
                                      Dimensions.Static_margins_and_paddings(
                                          Dimensions.screenheight, 16),
                                  color: currentindex == 2
                                      ? Color.fromRGBO(0, 188, 212, 100)
                                      : Colors.black,
                                  decoration: currentindex == 2
                                      ? TextDecoration.underline
                                      : TextDecoration.none)),
                        ),
                      )
                    ])
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Expanded(
              child: GestureDetector(
            child: Container(
              child: PageView(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentindex = value;
                  });
                },
                children: pages,
              ),
            ),
          ))
        ],
      ),
    );
  }
}
