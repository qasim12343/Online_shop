import 'package:shop/data/item.dart';

class Promotion{
  String imagePath;
  String title;
  String subtitle;
  String tag;
  String caption;
  List<Item>? list ;

  Promotion({
    this.title = '',
    this.caption = '',
    required this.imagePath,
    this.subtitle = '',
    this.tag = '',
    this.list,
  });
}