import 'package:flutter/cupertino.dart';

class PromotionCard extends StatelessWidget {
  final String? imagePath;
  final String title;
  final String backgroundImagePath;
  final String subtitle;
  final String? tag;
  final String? caption;
  final bool? reversedGradiant;
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
    return Container();
  }
}
