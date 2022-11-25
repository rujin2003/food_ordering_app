import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mrfoodiee/widgets/distance_icon_and_time.dart';

import '../functions/dimensions.dart';
import 'rattiings.dart';

class Foodcolumn extends StatelessWidget {
  final String foodtext;
  final bool veg;
  final String time;
  final String likes;
  final double textfontsize;
  const Foodcolumn(
      {super.key,
      required this.foodtext,
      required this.veg,
      required this.time,
      required this.likes,
      required this.textfontsize});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.all(
            Dimensions.Static_margins_and_paddings(Dimensions.screenheight, 7)),
        child: Text(
          foodtext,
          style: TextStyle(
              fontSize: Dimensions.Static_margins_and_paddings(
                  Dimensions.screenheight, textfontsize)),
        ),
      ),
      SizedBox(
        height:
            Dimensions.Static_margins_and_paddings(Dimensions.screenheight, 10),
      ),
      DistanceAndtime(
        veg: veg,
        time: time,
        likes: likes,
      ),
      SizedBox(
        height:
            Dimensions.Static_margins_and_paddings(Dimensions.screenheight, 20),
      ),
      Rattings(),
    ]);
  }
}
