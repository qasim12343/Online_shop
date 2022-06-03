import 'dart:ui';

import 'package:flutter/material.dart';

class Item {
  String name;
  String imagePath;
  int discount;
  double originalPrice;
  double rating;
  bool isMine;
  List<Color>? colors  = [Colors.white];

  Item({required this.name, required this.imagePath, required this.discount, required this.originalPrice,
      required this.rating,this.isMine = false, this.colors});
  double get Price{
    return discount != 0 ? (originalPrice -(originalPrice*discount/100)):(originalPrice);
  }
  static String format(double price){
    return price.toStringAsFixed(2)+'R';
  }
}