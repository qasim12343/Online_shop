import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'acolor.dart';

class MyColorList extends StatefulWidget {
  List<Color> colors;
  MyColorList({Key? key, required this.colors}) : super(key: key);

  @override
  State<MyColorList> createState() => _MyColorListState();
}

class _MyColorListState extends State<MyColorList> {

  @override

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(200)
        ),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
            itemBuilder: (context, index){
          return AColor(color: widget.colors[index]);
        }),
      )
      );
  }
}

