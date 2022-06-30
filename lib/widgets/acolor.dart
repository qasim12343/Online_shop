import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AColor extends StatefulWidget {
  bool isSelected ;
  Color color;
  AColor({Key? key,this.isSelected = false , required this.color}) : super(key: key);

  @override
  State<AColor> createState() => _AColorState();
}

class _AColorState extends State<AColor> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              widget.isSelected = !widget.isSelected;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 3)],
              shape: BoxShape.circle,
              color: widget.color,
            ),
            height: 40,
            width: 40,
            child:
            Center(child: widget.isSelected ? SvgPicture.asset('assets/icons/tick.svg'):null),
          ),
        ),
        SizedBox(width: 20,),
      ],
    );
  }
}