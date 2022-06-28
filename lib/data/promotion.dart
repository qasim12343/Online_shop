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

  Map toJson(){
    List<Map>? list =
        this.list != null? this.list!.map((e) => e.toJson()).toList(): [];
    return{
      'imagePath': imagePath,
      'titel': title,
      'subtitle': subtitle,
      'tag': tag,
      'caption': caption,
      'list': list,
    };
  }
}