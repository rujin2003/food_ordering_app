// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/functions/dimensions.dart';
import 'package:mrfoodiee/pagess/food_info_addtocart.dart';
import 'package:mrfoodiee/pagess/foodinsliderinfo.dart';
import 'package:mrfoodiee/widgets/distance_icon_and_time.dart';
import 'package:mrfoodiee/widgets/foodcolumn.dart';
import 'package:dots_indicator/dots_indicator.dart';

class Foodpagebody extends StatefulWidget {
  Foodpagebody({super.key});

  @override
  State<Foodpagebody> createState() => _FoodpagebodyState();
}

class _FoodpagebodyState extends State<Foodpagebody> {
  PageController controller = PageController(viewportFraction: 0.85);
  var currentpagevalue = 0.0;
  double scalefactor = 0.8;
  double height = 220;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentpagevalue = controller.page!;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List slider = [
      {
        'name': 'Malay Fish Curry',
        'image': 'images/foodpics/maincourse1.jpg',
        "price": 15,
        "veg": false,
        "time": '30min'
            "numprice"
      },
      {
        'name': 'Hakimi Shushi',
        'image': 'images/foodpics/starter4.jpg',
        "price": 15,
        "veg": false,
        "time": '17min'
      },
      {
        'name': 'Blueberry Pie',
        'image': 'images/foodpics/desert1.jpg',
        "price": 7,
        "veg": true,
        "time": '20min'
      },
      {
        'name': 'Havana Pizza ',
        'image': 'images/foodpics/maincourse10.jpg',
        "price": 22,
        "veg": false,
        "time": '18min'
      },
      {
        'name': 'Cheese Platter',
        'image': 'images/foodpics/starter3.jpg',
        "price": 13,
        "veg": true,
        "time": '3min'
      },
    ];
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: Dimensions.home_bodyPage_maincontainer,
            child: PageView.builder(
                controller: controller,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return foodslider(
                      index,
                      slider[index]['image'],
                      slider[index]['name'],
                      slider[index]['veg'],
                      slider[index]['time'],
                      slider[index]['price']);
                }),
          ),
          Center(
            child: DotsIndicator(
              dotsCount: 5,
              position: currentpagevalue,
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
          SizedBox(
            height: Dimensions.Static_margins_and_paddings(
                Dimensions.screenheight, 25),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(
                left: Dimensions.Static_margins_and_paddings(
                    Dimensions.screenheight, 30)),
            child: Text(
              'Popular',
              style: TextStyle(
                  fontSize: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 20)),
            ),
          ),
          Container(
            height: 900,
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                      margin: EdgeInsets.only(
                          left: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20),
                          right: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20),
                          bottom: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 15)),
                      child: Popularitem(index),
                    )),
          )
        ],
      ),
    );
  }

  Widget foodslider(int index, image, title, veg, time, price) {
    Matrix4 matix = Matrix4.identity();
    if (index == currentpagevalue.floor()) {
      var currentScale = 1 - (currentpagevalue - index) * (1 - scalefactor);
      var currenttransform = height * (1 - currentScale) / 2;
      matix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currenttransform, 0);
    } else if (index == currentpagevalue.floor() + 1) {
      var currentScale =
          scalefactor + (currentpagevalue - index + 1) * (1 - scalefactor);
      var currenttransform = height * (1 - currentScale) / 2;
      matix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currenttransform, 0);
    } else if (index == currentpagevalue.floor() - 1) {
      var currentScale = 1 - (currentpagevalue - index) * (1 - scalefactor);
      var currenttransform = height * (1 - currentScale) / 2;
      matix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currenttransform, 0);
    } else {
      var currentscale = 0.8;
      matix = Matrix4.diagonal3Values(1, currentscale, 1)
        ..setTranslationRaw(0, height * (1 - scalefactor), 0);
    }
    return Transform(
      transform: matix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.home_bodyPage_img,
            margin: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: const Color.fromRGBO(165, 105, 189, 100),
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image))),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                Get.to(
                    () => Foodsliderinfo(
                          price: price,
                          image: image,
                          title: title,
                          veg: veg,
                        ),
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 550));
              },
              child: Container(
                height: Dimensions.home_bodyPage_lable + 7.1,
                margin: EdgeInsets.only(
                    left: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 30),
                    right: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 30),
                    bottom: Dimensions.Static_margins_and_paddings(
                        Dimensions.screenheight, 15)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(229, 231, 233, 100),
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                      BoxShadow(color: Colors.white, offset: Offset(5, 0))
                    ]),
                child: Foodcolumn(
                  foodtext: title,
                  veg: veg,
                  time: time,
                  likes: '112',
                  textfontsize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget Popularitem(index) {
    List popular = [
      {
        'name': 'Nachos and Crondip',
        'image': 'images/foodpics/starter7.jpg',
        "price": 10,
        "veg": true,
        "time": '7min'
      },
      {
        'name': 'Lamb Tartar',
        'image': 'images/foodpics/maincourse6.jpg',
        "price": 21,
        "veg": false,
        "time": '15min'
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
      {
        'name': 'Shrimp pie',
        'image': 'images/foodpics/starter8.jpg',
        "price": 17,
        "veg": false,
        "time": '20min'
      },
    ];
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(
                () => Foodinfocart(
                      price: popular[index]['price'],
                      title: popular[index]['name'],
                      image: popular[index]['image'],
                      veg: popular[index]['veg'],
                      time: popular[index]['time'],
                    ),
                transition: Transition.zoom,
                duration: Duration(milliseconds: 300));
          },
          child: Container(
            height: Dimensions.Static_margins_and_paddings(
                Dimensions.screenheight, 145),
            width: Dimensions.Static_margins_and_paddings(
                Dimensions.screenheight, 145),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(popular[index]['image']),
                  fit: BoxFit.cover),
              color: Color.fromRGBO(171, 235, 198, 100),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: GestureDetector(
              onTap: () {
                Get.to(
                    () => Foodinfocart(
                          price: popular[index]['price'],
                          title: popular[index]['name'],
                          image: popular[index]['image'],
                          veg: popular[index]['veg'],
                          time: popular[index]['time'],
                        ),
                    transition: Transition.rightToLeftWithFade,
                    duration: Duration(milliseconds: 550));
              },
              child: Container(
                  height: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 145),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 243, 244, 100),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                        20,
                      ),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.Static_margins_and_paddings(
                            Dimensions.screenheight, 10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          popular[index]['name'],
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: Dimensions.Static_margins_and_paddings(
                                Dimensions.screenheight, 16),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 7),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: Dimensions.Static_margins_and_paddings(
                                  Dimensions.screenheight, 5)),
                          child: Text(
                            'worlds no one mexican dish is ',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.grey,
                              fontSize: Dimensions.Static_margins_and_paddings(
                                  Dimensions.screenheight, 13),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 20),
                        ),
                        DistanceAndtime(
                            veg: popular[index]['veg'],
                            time: popular[index]['time'],
                            likes: '100')
                      ],
                    ),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
