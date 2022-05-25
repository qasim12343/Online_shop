import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ActionButton extends StatelessWidget {
  final String iconPath;

  final String title;

  final Function() onTap;

  final bool active;


  const ActionButton({
    required this.iconPath,
    required this.title,
    required this.onTap,
    Key? key, this.active = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        children: [
          SvgPicture.asset(iconPath,height: 20,width: 20,),
          Stack(
            clipBehavior: Clip.none, children: [
            Text(title,
              style: TextStyle(color: active ? Colors.blue : Colors.black38),
            ),
            Positioned(
                top: -3,
                right: -12,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 1, color: Colors.blue)
                  ),
                  height: 14,
                  width: 14,
                  child: SvgPicture.asset('assets/icons/tick.svg',),
                )
            )
          ],
          )],
      ),
    );
  }
}