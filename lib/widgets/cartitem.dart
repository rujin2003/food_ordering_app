// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mrfoodiee/functions/dimensions.dart';
import 'package:mrfoodiee/functions/shooping.dart';
import 'package:provider/provider.dart';

class Cartitem extends StatefulWidget {
  final String image;
  final String foodname;
  final int price;
  final int index;

  const Cartitem({
    super.key,
    required this.price,
    required this.image,
    required this.foodname,
    required this.index,
  });

  @override
  State<Cartitem> createState() => _CartitemState();
}

class _CartitemState extends State<Cartitem> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 90),
          width: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 90),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.cover),
            color: Color.fromRGBO(171, 235, 198, 100),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Expanded(
            child: Container(
          height: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 90),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                20,
              ),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 5),
            ),
            Row(
              children: [
                SizedBox(
                  width: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 10),
                ),
                Text(
                  widget.foodname,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 16),
                  ),
                ),
                SizedBox(
                  width: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 7),
                ),
                Text(
                  "(" + "\$" + widget.price.toString() + ")",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 13),
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (() {
                        if (Provider.of<addCart>(context, listen: false)
                                .ola[widget.index]['quantity'] >
                            1) {
                          Provider.of<addCart>(context, listen: false)
                              .substractquantity(widget.index);
                          Provider.of<addCart>(context, listen: false)
                              .refreshtotoalSub(widget.price);
                        }
                      }),
                      child: Icon(
                        Icons.remove,
                        size: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 25),
                        color: Color.fromRGBO(230, 74, 25, 100),
                      ),
                    ),
                    SizedBox(
                      width: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 7),
                    ),
                    Text(
                        Provider.of<addCart>(context, listen: false)
                            .ola[widget.index]['quantity']
                            .toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 7),
                    ),
                    GestureDetector(
                      onTap: (() {
                        setState(() {
                          Provider.of<addCart>(context, listen: false)
                              .addquantity(widget.index);
                          Provider.of<addCart>(context, listen: false)
                              .refreshtotoalAdd(widget.price);
                        });
                      }),
                      child: Icon(
                        Icons.add,
                        size: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 25),
                        color: Color.fromRGBO(230, 74, 25, 100),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: (() {
                          Provider.of<addCart>(context, listen: false)
                              .removeitem(widget.index, widget.price);
                        }),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                    SizedBox(
                      width: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 20),
                    )
                  ],
                )
              ],
            ),
          ]),
        ))
      ],
    );
  }
}
