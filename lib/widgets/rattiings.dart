import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Rattings extends StatefulWidget {
  const Rattings({super.key});

  @override
  State<Rattings> createState() => _RattingsState();
}

class _RattingsState extends State<Rattings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
          children: List.generate(
              5,
              (index) => Padding(
                    padding: const EdgeInsets.all(2),
                    child: Icon(
                      Icons.star,
                      color: Color.fromRGBO(244, 208, 63, 100),
                    ),
                  ))),
    );
  }
}
