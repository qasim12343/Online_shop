import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String? tag;
  final String? caption;
  final Function() onTap;
  static List<Color> bkColors = [Colors.blue.withOpacity(0.1), Colors.grey];
  const PromotionCard({
    this.tag,
    required this.subtitle,
    this.caption,
    required this.title,
    required this.imagePath,
    Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        width: 250,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset.zero,
              blurRadius: 15,
            )
          ],
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.contain,
          )
        ),
        child: Stack(
          children: [
            Wrap(direction: Axis.vertical, children: [
              Text(this.title, style: TextStyle(fontSize: 14, height: 1.5, color: Colors.amber[800]),),
              Text(this.subtitle, style: TextStyle(fontSize: 20, height: 1.5, color: Colors.amber[800]),),
            ],
            ),
            Positioned(
                left: 4, bottom: 0,
                child: this.tag != ''
                    ? Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(this.tag!,style: TextStyle(fontSize: 12, color: Colors.white),),
                    )
                    : Text(
                  this.caption!,
                  style: TextStyle(fontSize: 12),
                  )
            )
          ],
        ),
      ),
    );
  }
}
