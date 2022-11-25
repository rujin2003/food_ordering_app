import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/pagess/food_info_addtocart.dart';

import '../functions/dimensions.dart';

class Menuitem extends StatefulWidget {
  final String image;
  final String title;
  final int price;
  final bool veg;
  final String time;

  const Menuitem(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.veg,
      required this.time});

  @override
  State<Menuitem> createState() => _MenuitemState();
}

class _MenuitemState extends State<Menuitem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Foodinfocart(
            price: widget.price,
            image: widget.image,
            title: widget.title,
            veg: widget.veg,
            time: widget.time));
      },
      child: Container(
        margin: EdgeInsets.only(top: 15),
        height: Dimensions.Static_margins_and_paddings(
            Dimensions.screenheight, 200),
        width: Dimensions.Static_margins_and_paddings(
            Dimensions.screenheight, 160),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xffDDDDDD),
            blurRadius: 6.0,
            spreadRadius: 2.0,
            offset: Offset(0.0, 0.0),
          )
        ], borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 10),
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 25),
                    ),
                    SizedBox(
                      width: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 10),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
                  height: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 120),
                  width: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 120),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.image), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(
                          Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 60)),
                      color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 10),
            ),
            Text(
              widget.title,
              style: TextStyle(
                  fontSize: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 16),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 7),
            ),
            Text(
              widget.price.toString(),
              style: TextStyle(
                  fontSize: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 16),
                  color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
