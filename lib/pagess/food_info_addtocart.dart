// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:mrfoodiee/widgets/bottomslideablebar.dart';

import '../functions/dimensions.dart';
import '../widgets/foodcolumn.dart';

class Foodinfocart extends StatelessWidget {
  final String image;
  final String title;
  final bool veg;
  final String time;
  final int price;
  const Foodinfocart(
      {super.key,
      required this.image,
      required this.title,
      required this.veg,
      required this.time,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ),
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
                      Get.back();
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
                  Container(
                    height: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 47),
                    width: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 47),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(236, 240, 241, 30),
                        borderRadius: BorderRadius.circular(45 / 2.round())),
                    child: Icon(
                      Icons.shopping_cart_checkout_outlined,
                      color: Colors.black,
                      size: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight,
                          Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20)),
                    ),
                  ),
                ],
              )),
          Positioned(
              top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 350) -
                  15,
              child: Center(
                child: Container(
                  width: Dimensions.screenwidth,
                  height: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 50),
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(
                          Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 10),
                      ),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 350) +
                  Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 80),
              left: 15,
              child: Container(
                height: 300,
                width: Dimensions.screenwidth - 30,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffDDDDDD),
                        blurRadius: 6.0,
                        spreadRadius: 2.0,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                    color: Color.fromRGBO(251, 252, 252, 100),
                    borderRadius: BorderRadius.circular(
                        Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 20))),
                child: SingleChildScrollView(
                    child: Padding(
                  padding: EdgeInsets.only(
                      top: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 20),
                      left: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 20)),
                  child: Text(
                    '''Flutter widgets are built using a modern framework that takes inspiration from React. The central idea is that you build your UI out of widgets. Widgets describe what their view should look like given their current configuration and state.  When a widgets state changes, the widget rebuilds its description which the framework diffs against the previous description in order to determine the minimal changes needed in the underlying render tree to transtion.''',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                )),
              )),
          Positioned(
            child: DraggableScrollableSheet(
              builder: (context, scrollController) => SingleChildScrollView(
                  controller: scrollController,
                  child: Bottomdragbar(
                    name: title,
                    image: image,
                    price: price,
                    time: time,
                    veg: veg,
                  )),
              initialChildSize: 0.095,
              minChildSize: 0.095,
              maxChildSize: 0.25,
            ),
          )
        ]),
      ),
    );
  }
}
