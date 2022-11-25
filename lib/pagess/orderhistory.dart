import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mrfoodiee/functions/shooping.dart';
import 'package:provider/provider.dart';

class Orderhistory extends StatefulWidget {
  const Orderhistory({super.key});

  @override
  State<Orderhistory> createState() => _OrderhistoryState();
}

class _OrderhistoryState extends State<Orderhistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order history'),
        backgroundColor: Color.fromRGBO(165, 105, 189, 100),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Users')
              .doc(FirebaseAuth.instance.currentUser!.email)
              .collection('Order')
              .snapshots(),
          builder: ((context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                itemBuilder: ((context, lindex) => SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(top: 50, left: 10, right: 10),
                            width: 325,
                            height: 200,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffDDDDDD),
                                    blurRadius: 6.0,
                                    spreadRadius: 2.0,
                                    offset: Offset(0.0, 0.0),
                                  )
                                ]),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topLeft,
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              left: 20, top: 20),
                                          child: Text(
                                            'Order $lindex',
                                            style: TextStyle(fontSize: 16),
                                          ))),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: snapshot
                                          .data!.docs[lindex]['order'].length,
                                      itemBuilder: ((context, index) => Column(
                                            children: [
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 35,
                                                width: 300,
                                                decoration: BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        242, 243, 244, 100),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Center(
                                                  child: Row(
                                                    children: [
                                                      Text(snapshot.data!
                                                                  .docs[lindex]
                                                              ['order'][index]
                                                          ['name']),
                                                      SizedBox(
                                                        width: 7,
                                                      ),
                                                      Text('(' '\$' +
                                                          snapshot
                                                              .data!
                                                              .docs[lindex]
                                                                  ['order']
                                                                  [index]
                                                                  ['price']
                                                              .toString() +
                                                          ')')
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ))),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )));
          })),
    );
  }
}
// Text(snapshot.data!.docs[0]['order'][index]['name'])