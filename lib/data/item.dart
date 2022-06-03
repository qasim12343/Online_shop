import 'dart:ui';

import 'package:flutter/material.dart';

class Item {
  int count;
  String sellerName ;
  String name;
  String imagePath;
  int discount;
  double originalPrice;
  double rating;
  bool isMine;
  List<Color>? colors  = [Colors.black12];

  Item({required this.name, required this.imagePath, required this.discount, required this.originalPrice,
      required this.rating,this.isMine = false, this.colors, this.sellerName = 'NamaKala', this.count = 10});
  double get Price{
    return discount != 0 ? (originalPrice -(originalPrice*discount/100)):(originalPrice);
  }
  static String format(double price){
    return price.toStringAsFixed(2)+'R';
  }
}