// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../functions/dimensions.dart';
import '../functions/shooping.dart';

class Addtocart extends StatefulWidget {
  final int price;
  final String name;
  final String image;
  const Addtocart(
      {super.key,
      required this.price,
      required this.name,
      required this.image});

  @override
  State<Addtocart> createState() => _AddtocartState();
}

class _AddtocartState extends State<Addtocart> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 50,
          width: 110,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color(0xffDDDDDD),
                blurRadius: 6.0,
                spreadRadius: 2.0,
                offset: Offset(0.0, 0.0),
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (() {
                    setState(() {
                      if (quantity > 1) {
                        quantity = quantity - 1;
                      }
                    });
                  }),
                  icon: Icon(Icons.remove)),
              Text(
                quantity.toString(),
                style: TextStyle(fontSize: 18),
              ),
              IconButton(
                onPressed: (() {
                  setState(() {
                    quantity = quantity + 1;
                  });
                }),
                icon: Icon(Icons.add),
              )
            ],
          ),
        ),
        SizedBox(
          width: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 18),
        ),
        ElevatedButton(
          onPressed: () {
            Provider.of<addCart>(context, listen: false)
                .addtocart(widget.name, widget.image, widget.price, quantity);
            Provider.of<addCart>(context, listen: false).totalclac();
          },
          child: Text("\$" + widget.price.toString()),
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: Color.fromRGBO(187, 143, 206, 100),
            padding: EdgeInsets.all(24),
          ),
        )
      ],
    );
  }
}
