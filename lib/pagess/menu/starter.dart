// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mrfoodiee/widgets/menuitem.dart';

import '../../functions/dimensions.dart';

class Starter extends StatelessWidget {
  const Starter({super.key});

  @override
  Widget build(BuildContext context) {
    List starter = [
      {
        'name': 'Avocado Toast',
        'image': 'images/foodpics/starter1.jpg',
        "price": 3,
        "veg": true,
        "time": '7min'
      },
      {
        'name': 'Tomato Soup',
        'image': 'images/foodpics/starter2.jpg',
        "price": 5,
        "veg": true,
        "time": '15min'
      },
      {
        'name': 'Cheese Platter',
        'image': 'images/foodpics/starter3.jpg',
        "price": 13,
        "veg": true,
        "time": '3min'
      },
      {
        'name': 'Hakimi Shushi',
        'image': 'images/foodpics/starter4.jpg',
        "price": 15,
        "veg": false,
        "time": '17min'
      },
      {
        'name': 'Candied Bacon',
        'image': 'images/foodpics/starter5.jpg',
        "price": 3,
        "veg": false,
        "time": '5min'
      },
      {
        'name': 'Fresh Aaoli Salad',
        'image': 'images/foodpics/starter6.jpg',
        "price": 11,
        "veg": true,
        "time": '5min'
      },
      {
        'name': 'Nachos and Crondip',
        'image': 'images/foodpics/starter7.jpg',
        "price": 10,
        "veg": true,
        "time": '7min'
      },
      {
        'name': 'Shrimp pie',
        'image': 'images/foodpics/starter8.jpg',
        "price": 17,
        "veg": false,
        "time": '20min'
      },
      {
        'name': 'Brocoli Sorbe',
        'image': 'images/foodpics/starter9.jpg',
        "price": 14,
        "veg": true,
        "time": '10min'
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
