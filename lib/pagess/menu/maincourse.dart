import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/pagess/menu/menu.dart';

import '../../functions/dimensions.dart';
import '../../widgets/menuitem.dart';

class Maincourse extends StatefulWidget {
  const Maincourse({super.key});

  @override
  State<Maincourse> createState() => _MaincourseState();
}

class _MaincourseState extends State<Maincourse> {
  @override
  Widget build(BuildContext context) {
    List starter = [
      {
        'name': 'Malay Fish Curry',
        'image': 'images/foodpics/maincourse1.jpg',
        "price": 15,
        "veg": false,
        "time": '30min'
      },
      {
        'name': 'Clam Strew Noodle',
        'image': 'images/foodpics/maincourse2.jpg',
        "price": 17,
        "veg": false,
        "time": '23min'
      },
      {
        'name': 'Buttered Lobster',
        'image': 'images/foodpics/maincourse3.jpg',
        "price": 30,
        "veg": false,
        "time": '30min'
      },
      {
        'name': 'Kings Burger',
        'image': 'images/foodpics/maincourse4.jpg',
        "price": 23,
        "veg": false,
        "time": '16min'
      },
      {
        'name': 'Steak Chowmein',
        'image': 'images/foodpics/maincourse5.jpg',
        "price": 19,
        "veg": false,
        "time": '20min'
      },
      {
        'name': 'Lamb Tartar',
        'image': 'images/foodpics/maincourse6.jpg',
        "price": 21,
        "veg": false,
        "time": '15min'
      },
      {
        'name': 'Seared tuna',
        'image': 'images/foodpics/maincourse7.jpg',
        "price": 26,
        "veg": false,
        "time": '13min'
      },
      {
        'name': 'Masala curry',
        'image': 'images/foodpics/maincourse8.jpg',
        "price": 17,
        "veg": false,
        "time": '30min'
      },
      {
        'name': 'Aglogi Pasta ',
        'image': 'images/foodpics/maincourse9.jpg',
        "price": 16,
        "veg": true,
        "time": '25min'
      },
      {
        'name': 'Havana Pizza ',
        'image': 'images/foodpics/maincourse10.jpg',
        "price": 22,
        "veg": false,
        "time": '18min'
      },
      {
        'name': 'Crabpie Burger ',
        'image': 'images/foodpics/maincourse11.jpg',
        "price": 29,
        "veg": false,
        "time": '22min'
      }
    ];

    return Container(
      child: SingleChildScrollView(
        child: Column(children: [
          rows(
              starter[0]['image'],
              starter[0]['name'],
              starter[0]['price'],
              starter[1]['image'],
              starter[1]['name'],
              starter[1]['price'],
              starter[0]['veg'],
              starter[0]['time'],
              starter[1]['veg'],
              starter[1]['time']),
          rows(
              starter[2]['image'],
              starter[2]['name'],
              starter[2]['price'],
              starter[3]['image'],
              starter[3]['name'],
              starter[3]['price'],
              starter[2]['veg'],
              starter[2]['time'],
              starter[3]['veg'],
              starter[3]['time']),
          rows(
              starter[4]['image'],
              starter[4]['name'],
              starter[4]['price'],
              starter[5]['image'],
              starter[5]['name'],
              starter[5]['price'],
              starter[4]['veg'],
              starter[4]['time'],
              starter[5]['veg'],
              starter[5]['time']),
          rows(
              starter[6]['image'],
              starter[6]['name'],
              starter[6]['price'],
              starter[7]['image'],
              starter[7]['name'],
              starter[7]['price'],
              starter[6]['veg'],
              starter[6]['time'],
              starter[7]['veg'],
              starter[7]['time']),
          rows(
              starter[8]['image'],
              starter[8]['name'],
              starter[8]['price'],
              starter[9]['image'],
              starter[9]['name'],
              starter[9]['price'],
              starter[8]['veg'],
              starter[8]['time'],
              starter[9]['veg'],
              starter[9]['time']),
          Menuitem(
            image: starter[10]['image'],
            title: starter[10]['name'],
            price: starter[10]['price'],
            veg: starter[10]['veg'],
            time: starter[10]['time'],
          ),
          SizedBox(
            height: Dimensions.Static_margins_and_paddings(
                Dimensions.screenheight, 10),
          )
        ]),
      ),
    );
  }
}

Widget rows(
    image1, title1, price1, image2, title2, price2, veg1, time1, veg2, time2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Menuitem(
        image: image1,
        title: title1,
        price: price1,
        veg: veg1,
        time: time1,
      ),
      Menuitem(
          image: image2, title: title2, price: price2, veg: veg2, time: time2)
    ],
  );
}
