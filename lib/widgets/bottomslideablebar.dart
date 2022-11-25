// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:mrfoodiee/widgets/add_to_cart.dart';
import 'package:mrfoodiee/widgets/distance_icon_and_time.dart';
import 'package:mrfoodiee/widgets/rattiings.dart';

import '../functions/dimensions.dart';

class Bottomdragbar extends StatefulWidget {
  final bool veg;
  final String time;
  final int price;
  final String name;
  final String image;
  const Bottomdragbar({
    super.key,
    required this.veg,
    required this.time,
    required this.price,
    required this.name,
    required this.image,
  });

  @override
  State<Bottomdragbar> createState() => _BottomdragbarState();
}

class _BottomdragbarState extends State<Bottomdragbar> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: OvalTopBorderClipper(),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 20.0, // Soften the shaodw
                spreadRadius: 2.0,
                offset: Offset(0.0, 0.0),
              )
            ],
          ),
          height: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 200),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      Icons.keyboard_arrow_up,
                      size: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 35),
                      color: Colors.black,
                    )),
                DistanceAndtime(
                    veg: widget.veg, time: widget.time, likes: '112'),
                Rattings(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: (() {
                          if (clicked == false) {
                            setState(() {
                              clicked = true;
                            });
                          } else {
                            setState(() {
                              clicked = false;
                            });
                          }
                        }),
                        child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Icon(
                            Icons.favorite,
                            color: clicked ? Colors.red : Colors.grey,
                            size: 35,
                          ),
                        )),
                    Container(
                        margin: EdgeInsets.only(
                            right: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 15)),
                        child: Addtocart(
                          name: widget.name,
                          image: widget.image,
                          price: widget.price,
                        )),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
