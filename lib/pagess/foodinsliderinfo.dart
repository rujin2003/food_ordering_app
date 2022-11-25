// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:mrfoodiee/widgets/add_to_cart.dart';
import 'package:mrfoodiee/widgets/foodcolumn.dart';

import '../functions/dimensions.dart';

class Foodsliderinfo extends StatelessWidget {
  final String image;
  final String title;
  final bool veg;
  final int price;
  const Foodsliderinfo(
      {super.key,
      required this.image,
      required this.title,
      required this.veg,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.Static_margins_and_paddings(
                    Dimensions.screenheight, 350),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          image,
                        ),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 10),
              left: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 20),
              right: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Get.back(canPop: false);
                    }),
                    child: Container(
                      height: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 47),
                      width: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 47),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(236, 240, 241, 30),
                          borderRadius: BorderRadius.circular(45 / 2.round())),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 47),
                  )
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 350) -
                  20,
              child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 13)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    children: [
                      Foodcolumn(
                        foodtext: title,
                        veg: veg,
                        time: '30min',
                        likes: '300',
                        textfontsize: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 25),
                      ),
                      Container(
                        height: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 250),
                        padding: EdgeInsets.only(
                            top: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 15),
                            left: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 25)),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Introduce',
                                style: TextStyle(
                                    fontSize:
                                        Dimensions.Static_margins_and_paddings(
                                            Dimensions.screenheight, 22)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.Static_margins_and_paddings(
                                      Dimensions.screenheight, 30)),
                              height: 150,
                              decoration: BoxDecoration(),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  'Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.Flutter is Googles mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 16)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))),
        ]),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(
              bottom: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 2)),
          height: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 80),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      bottom: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 10),
                      right: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 20)),
                  child: Addtocart(
                    name: title,
                    image: image,
                    price: price,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
