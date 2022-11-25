import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../functions/dimensions.dart';
import '../../widgets/menuitem.dart';

class Desert extends StatefulWidget {
  const Desert({super.key});

  @override
  State<Desert> createState() => _DesertState();
}

class _DesertState extends State<Desert> {
  @override
  Widget build(BuildContext context) {
    List starter = [
      {
        'name': 'Blueberry Pie',
        'image': 'images/foodpics/desert1.jpg',
        "price": 7,
        "veg": true,
        "time": '20min'
      },
      {
        'name': 'Strawberry Moose',
        'image': 'images/foodpics/desert2.jpg',
        "price": 15,
        "veg": false,
        "time": '10min'
      },
      {
        'name': 'Fruit Cake',
        'image': 'images/foodpics/desert3.jpg',
        "price": 21,
        "veg": false,
        "time": '25min'
      },
      {
        'name': 'Philly\'s Pie',
        'image': 'images/foodpics/desert4.jpg',
        "price": 15,
        "veg": true,
        "time": '25min'
      },
      {
        'name': 'Chocolate lava',
        'image': 'images/foodpics/desert5.jpg',
        "price": 13,
        "veg": true,
        "time": '15min'
      },
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
          Menuitem(
            image: starter[4]['image'],
            title: starter[4]['name'],
            price: starter[4]['price'],
            time: starter[4]['time'],
            veg: starter[4]['veg'],
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
