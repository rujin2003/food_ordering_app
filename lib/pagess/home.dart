// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mrfoodiee/functions/dimensions.dart';
import 'package:mrfoodiee/functions/notifications.dart';
import 'package:mrfoodiee/pagess/food_info_addtocart.dart';
import 'package:mrfoodiee/pagess/foodpage_body.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FocusNode focusnode = FocusNode();
  List<String> searched = [];
  List indexes = [];
  TextEditingController search = TextEditingController();
  int state = 0;

  @override
  void dispose() {
    focusnode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List all_foods = [
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
      },
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

    List<String> foodnames = [
      'Malay Fish Curry',
      'Clam Strew Noodle',
      'Buttered Lobster',
      'Kings Burger',
      'Steak Chowmein',
      'Lamb Tartar',
      'Seared tuna',
      'Masala curry',
      'Aglogi Pasta ',
      'Havana Pizza ',
      'Crabpie Burger ',
      'Blueberry Pie',
      'Strawberry Moose',
      'Fruit Cake',
      'Philly\'s Pie',
      'Chocolate lava',
      'Avocado Toast',
      'Tomato Soup',
      'Cheese Platter',
      'Hakimi Shushi',
      'Candied Bacon',
      'Fresh Aaoli Salad',
      'Nachos and Crondip',
      'Shrimp pie',
      'Brocoli Sorbe',
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.Static_margins_and_paddings(
                              Dimensions.screenheight, 25)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                              left: Dimensions.Static_margins_and_paddings(
                                  Dimensions.screenheight, 15),
                            ),
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('images/profilepc.png')),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                right: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 15)),
                            child: Container(
                                height: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 45),
                                width: Dimensions.Static_margins_and_paddings(
                                    Dimensions.screenheight, 45),
                                decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(155, 89, 182, 100),
                                    borderRadius: BorderRadius.circular(30)),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      focusnode.requestFocus();
                                      state = 1;
                                    });
                                  },
                                  icon: const Icon(Icons.search),
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.Static_margins_and_paddings(
                          Dimensions.screenheight, 17),
                    ),
                    Expanded(
                        child: SingleChildScrollView(child: Foodpagebody()))
                  ],
                ),
                Positioned(
                  top: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 30),
                  right: Dimensions.Static_margins_and_paddings(
                      Dimensions.screenheight, 25),
                  child: SingleChildScrollView(
                      child: state == 1
                          ? Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 40),
                                      width: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 250),
                                      margin: EdgeInsets.only(
                                          right: Dimensions
                                              .Static_margins_and_paddings(
                                                  Dimensions.screenheight, 30)),
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              215, 219, 221, 100),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: Dimensions
                                                .Static_margins_and_paddings(
                                                    Dimensions.screenheight,
                                                    8)),
                                        child: TextField(
                                          controller: search,
                                          focusNode: focusnode,
                                          decoration: InputDecoration(
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            hintText: '  Search....',
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              searched = foodnames
                                                  .where((element) => element
                                                      .toLowerCase()
                                                      .contains(
                                                          value.toLowerCase()))
                                                  .toList();
                                            });
                                            print(searched);
                                          },
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: Dimensions
                                          .Static_margins_and_paddings(
                                              Dimensions.screenheight, 20),
                                      child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            state = 0;
                                          });
                                        },
                                        icon: Icon(Icons.cancel),
                                        color: Colors.red,
                                        iconSize: Dimensions
                                            .Static_margins_and_paddings(
                                                Dimensions.screenheight, 32),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                    top: Dimensions.Static_margins_and_paddings(
                                        Dimensions.screenheight, 70),
                                    left: 0,
                                    child: Container(
                                        margin: EdgeInsets.only(
                                            top: Dimensions.Static_margins_and_paddings(
                                                Dimensions.screenheight, 20),
                                            right: Dimensions.Static_margins_and_paddings(
                                                Dimensions.screenheight, 30)),
                                        height:
                                            Dimensions.Static_margins_and_paddings(
                                                Dimensions.screenheight, 250),
                                        width:
                                            Dimensions.Static_margins_and_paddings(
                                                Dimensions.screenheight, 300),
                                        decoration: BoxDecoration(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 40),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: ListView.builder(
                                          itemCount: search.text.isNotEmpty
                                              ? searched.length
                                              : 0,
                                          itemBuilder: ((context, index) {
                                            return SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: Dimensions
                                                        .Static_margins_and_paddings(
                                                            Dimensions
                                                                .screenheight,
                                                            10),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Get.to(Foodinfocart(
                                                          price: all_foods[foodnames.indexWhere((element) => element.contains(searched[index]))]
                                                              ['price'],
                                                          image:
                                                              all_foods[foodnames.indexWhere((element) => element.contains(searched[index]))]
                                                                  ['image'],
                                                          title:
                                                              all_foods[foodnames.indexWhere((element) => element.contains(searched[index])) + 1]
                                                                  ['name'],
                                                          veg: all_foods[foodnames.indexWhere((element) => element.contains(searched[index]))]
                                                              ['veg'],
                                                          time: all_foods[
                                                              foodnames.indexWhere(
                                                                      (element) => element.contains(searched[index])) +
                                                                  1]['time']));
                                                    },
                                                    child: Container(
                                                      height: Dimensions
                                                          .Static_margins_and_paddings(
                                                              Dimensions
                                                                  .screenheight,
                                                              40),
                                                      width: Dimensions
                                                          .Static_margins_and_paddings(
                                                              Dimensions
                                                                  .screenheight,
                                                              290),
                                                      decoration: BoxDecoration(
                                                          color: Color.fromRGBO(
                                                              236,
                                                              240,
                                                              241,
                                                              90),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      15)),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: Dimensions
                                                                    .Static_margins_and_paddings(
                                                                        Dimensions
                                                                            .screenheight,
                                                                        15)),
                                                            height: Dimensions
                                                                .Static_margins_and_paddings(
                                                                    Dimensions
                                                                        .screenheight,
                                                                    33),
                                                            width: Dimensions
                                                                .Static_margins_and_paddings(
                                                                    Dimensions
                                                                        .screenheight,
                                                                    33),
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: AssetImage(
                                                                        all_foods[foodnames.indexWhere((element) => element.contains(searched[index])) + 1]
                                                                            [
                                                                            'image']),
                                                                    fit: BoxFit
                                                                        .cover),
                                                                color:
                                                                    Color.fromRGBO(
                                                                        88,
                                                                        214,
                                                                        141,
                                                                        100),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15)),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(
                                                                left: Dimensions
                                                                    .Static_margins_and_paddings(
                                                                        Dimensions
                                                                            .screenheight,
                                                                        10)),
                                                            child: Text(
                                                              searched[index],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }),
                                        )))
                              ],
                            )
                          : Container()),
                ),
              ],
            )));
  }
}
