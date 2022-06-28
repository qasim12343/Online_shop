import 'package:flutter/cupertino.dart';

class Category {
  String imagePath;
  String title;

  Category(this.imagePath,this.title);
  Map toJson() =>{
    'imagePath': imagePath,
    'title': title,
  };
}