import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shop/models/category.dart';
import 'package:shop/models/promotion.dart';


class Fake{
  static int numberOfItemsInCart = 1;
  static List<User> users = [];


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
      caption: '',

    ),
    Promotion(
      title: 'Git voucher gift',
      subtitle: '500000R',
      backgroundImagePath: 'assets/images/simpleBackground.jpg',
      reversedGradiant: true,
      caption: 'for new member\'s\nof Nama Kala',
      tag: '',
      imagePath: null,

    )
  ];

  static List<String> trend = [
    'assets/images/watch.jpg',
    'assets/images/mobleChair.jpg',
  ];

  static List<String> bests = [
    'assets/images/phone.jpg',
    'assets/images/coat.jpg',
    'assets/images/boots.jpg',
    'assets/images/shoes.jpg'
  ];
}
class User{
  String firstName = "";
  String lastName = "";
  String password = "";
  String email = "";
  String phoneNumber = "";

  User({required this.firstName,lastName,required this.password, required this.email, required this.phoneNumber});

}