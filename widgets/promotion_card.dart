import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PromotionCard extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String backgroundImagePath;
  final String subtitle;
  final String? tag;
  final String? caption;
  final bool? reversedGradiant;
  static List<Color> bkColors = [Colors.blue.withOpacity(0.1), Colors.grey];
  const PromotionCard({
    this.tag,
    required this.subtitle,
    this.reversedGradiant,
    this.caption,
    required this.backgroundImagePath,
    required this.title,
    this.imagePath,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: 250,
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset.zero,
            blurRadius: 15,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.topLeft,
          colors: reversedGradiant != null && reversedGradiant! ?
              bkColors.reversed.toList() : bkColors,
        ),
        image: DecorationImage(
          image: AssetImage(this.backgroundImagePath),
          fit: BoxFit.cover,
        )
      ),
      child: Stack(
        children: [
          if(this.imagePath != null)
            Center(child: Image.asset(
              this.imagePath!,
              height: 150,
              width: 245,
              )
            ),


          Wrap(direction: Axis.vertical, children: [
            Text(this.title, style: TextStyle(fontSize: 14, height: 1.5, color: Colors.white),),
            Text(this.subtitle, style: TextStyle(fontSize: 20, height: 1.5, color: Colors.white),),
          ],
          ),
          Positioned(
              left: 0, bottom: 0,
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
    );
  }
}
