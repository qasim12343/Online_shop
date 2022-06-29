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
  bool isFavorite;

  Map toJson(){
    List<int>? colors =
    this.colors != null? this.colors!.map((e) => e.value).toList(): [Colors.black12.value];
    return {
      'name': name,
      'sellerName': sellerName,
      'imagePath': imagePath,
      'discount': discount,
      'originalPrice': originalPrice,
      'rating': rating,
      'isMine':isMine,
      'count':count,
      'colors':colors,
      'isFavorite': isFavorite,
    };
  }
  factory Item.fromJson(dynamic json) {
    var colorValue = json['colors'] as List;
    List<Color> colors = [];
    colorValue.forEach((element) {
      colors.add(Color(element));
    });

    return Item(name: json['name'] as String, imagePath: json['imagePath'] as String,
      discount: json['discount'] as int , originalPrice: json['originalPrice'] as double, rating: json['rating'] as double,
      isMine: json['isMine'] != null ? json['isMine'] as bool: false,
      count: json['count'] != null ? json['count'] as int: 10,
      sellerName: json['sellerName'] != null ? json['sellerName'] as String: 'NamaKala',
      colors: json['colors'] !=null? colors : [Colors.black12], isFavorite: json['isFavorite'] as bool
    );
  }

  Item({required this.name, required this.imagePath, required this.discount, required this.originalPrice,
      required this.rating,this.isMine = false, this.colors, this.sellerName = 'NamaKala', this.count = 10, this.isFavorite = false});

  double get Price{
    return discount != 0 ? (originalPrice -(originalPrice*discount/100)):(originalPrice);
  }
  static String format(double price){
    return price.toStringAsFixed(2)+'R';
  }
}