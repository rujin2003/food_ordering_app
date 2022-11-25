// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../functions/dimensions.dart';

class DistanceAndtime extends StatelessWidget {
  final bool veg;
  final String time;
  final String likes;

  const DistanceAndtime({
    super.key,
    required this.veg,
    required this.time,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          height: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 20),
          image: veg
              ? AssetImage('images/veg.png')
              : AssetImage('images/nonveg.png'),
        ),
        SizedBox(
          width: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 23),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 3),
          child: Icon(
            Icons.access_time_rounded,
            color: Color.fromRGBO(125, 60, 152, 90),
          ),
        ),
        Text(
          time,
          style: TextStyle(
              color: Colors.grey,
              fontSize: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 13)),
        ),
        SizedBox(
          width: Dimensions.Static_margins_and_paddings(
              Dimensions.screenheight, 23),
        ),
        Icon(
          Icons.favorite,
          color: Color.fromRGBO(203, 67, 53, 90),
        ),
        Text(
          likes,
          style: TextStyle(
              color: Colors.grey,
              fontSize: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, 13)),
        ),
      ],
    );
  }
}
