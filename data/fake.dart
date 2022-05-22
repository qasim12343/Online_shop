import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/promotion.dart';


class Fake{
  static int numberOfItemsInCart = 1;

  static List <Category> categories = [
  Category(Icons.phonelink_rounded ,  'Digital'),
  Category(Icons.dry_cleaning , "Fashion and clothing"),
  Category( Icons.book , "Books"),
  ];

  static List<Promotion> promotions = [
    Promotion(title: 'All item \nDiscount up to',
      subtitle: '50%',
      backgroundImagePath: 'assets/images/simpleBack.jpg',
      tag: '3 April 2022',
      reversedGradiant: false,
      imagePath: 'assets/images/laptop.jpg',
    ),
    Promotion(title: 'Git voucher gift',
      subtitle: '\$50.00',
      backgroundImagePath: 'assets/images/simpleBack2.jpg',
      reversedGradiant: true,
      caption: '*for new member\'s\nof NamaKala',
    )
  ];
}