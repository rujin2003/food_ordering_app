// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'package:mrfoodiee/functions/dimensions.dart';
import 'package:mrfoodiee/pagess/orderhistory.dart';
import 'package:mrfoodiee/widgets/cartitem.dart';
import 'package:provider/provider.dart';

import '../functions/notifications.dart';
import '../functions/shooping.dart';

class Cart extends StatefulWidget {
  const Cart({
    super.key,
  });

  @override
  State<Cart> createState() => cart();
}

class cart extends State<Cart> {
  @override
  void initState() {
    service = LocalNotificationService();
    service.intialize();
    super.initState();
  }

  int itemcount = 1;

  late final LocalNotificationService service;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 40),
              left: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 20),
              child: Row(children: [
                Text(
                  'Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 35)),
                ),
                Icon(
                  Icons.shopping_cart_checkout_rounded,
                  size: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 35),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 200,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: (() {
                            Get.to(Orderhistory());
                          }),
                          icon: Icon(
                            Icons.attach_email_outlined,
                            size: 30,
                          )),
                    ),
                  ],
                )
              ])),
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.Static_margins_and_paddings(
                    Dimensions.screenheight, 150),
                left: Dimensions.Static_margins_and_paddings(
                    Dimensions.screenheight, 15)),
            height: 600,
            width: Dimensions.screenwidth -
                Dimensions.Static_margins_and_paddings(
                    Dimensions.screenheight, 30),
            decoration: BoxDecoration(
                color: Color.fromRGBO(236, 240, 241, 100),
                borderRadius: BorderRadius.circular(30)),
          ),
          ClipPath(
              clipper: OvalBottomBorderClipper(),
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 150)),
                height: Dimensions.Static_margins_and_paddings(
                    Dimensions.screenheight, 30),
                color: Colors.white,
              )),
          Container(
              margin: EdgeInsets.only(
                  top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 210),
                  right: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 15),
                  left: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 15)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                        height: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 400),
                        child: ListView.builder(
                            itemCount: Provider.of<addCart>(context).ola.length,
                            itemBuilder: ((context, index) => Column(
                                  children: [
                                    Cartitem(
                                      index: index,
                                      image: Provider.of<addCart>(context)
                                          .ola[index]['img'],
                                      price: Provider.of<addCart>(context)
                                          .ola[index]['price'],
                                      foodname: Provider.of<addCart>(context)
                                          .ola[index]['name'],
                                      // removeitem: removeitem(index),
                                    ),
                                    SizedBox(
                                      height: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 15),
                                    )
                                  ],
                                )))),
                    SizedBox(
                      height: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 50),
                    ),
                    Divider(
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20),
                        ),
                        Text(
                          'Total: ',
                        ),
                        SizedBox(
                          width: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 10),
                        ),
                        Text("\$" +
                            Provider.of<addCart>(context).total.toString()),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(46, 204, 113, 100)),
                            onPressed: (() {
                              _showDialog(
                                context,
                              );
                            }),
                            child: Text('Place order')),
                        SizedBox(
                          width: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void _showDialog(
    context,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Conformation"),
          content: Provider.of<addCart>(context, listen: false).total == 0
              ? Text('please enter items in your cart')
              : Text(
                  "your totoal is :${Provider.of<addCart>(context, listen: false).total}"),
          actions: <Widget>[
            Provider.of<addCart>(context, listen: false).total != 0
                ? ElevatedButton(
                    child: Text("OK"),
                    onPressed: () async {
                      await Provider.of<addCart>(context, listen: false)
                          .checkoutcart();
                      Provider.of<addCart>(context, listen: false).total != 0
                          ? await service.showNotification(
                              id: 0,
                              title: 'Cangratulations!!',
                              body:
                                  'Your order has been placed please check you email for futher in formation')
                          : await service.showNotification(
                              id: 0,
                              title: 'Cart',
                              body: 'Please place your order at cart first');

                      Navigator.of(context).pop();
                    },
                  )
                : ElevatedButton(
                    child: Text("OK"),
                    onPressed: () async {
                      Navigator.of(context).pop();
                    },
                  )
          ],
        );
      },
    );
  }
}
