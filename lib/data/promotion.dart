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
      'title': title,
      'subtitle': subtitle,
      'tag': tag,
      'caption': caption,
      'list': list,
    };
  }
  factory Promotion.fromJson(dynamic json){
    var jsonList = json['list'] as List;
    List<Item> list = jsonList.map((e) => Item.fromJson(e)).toList();
    return Promotion(
      title: json['title'] as String,
      caption: json['caption'] as String,
      subtitle: json['subtitle'] as String,
      tag: json['tag'] as String,
      imagePath: json['imagePath'] as String,
      list: list,
    );
  }
}