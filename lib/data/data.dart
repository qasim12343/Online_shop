import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shop/data/category.dart';
import 'package:shop/data/promotion.dart';
import 'package:shop/data/user.dart';


import 'item.dart';


class Data{
  static int numberOfItemsInCart = 1;
  List<User> _users = [User(
  firstName : "Qasem",
  lastName : "Yu",
  email : "qasem.yousifi20@gmail.com",
  password : "asdfgh",
  phoneNumber : "09926067529",
  )];

  void addUser(User user){
    _users.add(user);
  }
  List<User> getUsers(){
    return _users;
  }

  static List <Category> categories = [
  Category('assets/images/topSales.png' ,  'Best sales'),
  Category('assets/images/discount.png' , "Top discounts"),
  Category( 'assets/images/newProduct.jpg' , "New products "),
  ];

  static List<Promotion> digital = [
    Promotion(
      tag: 'Phone and Tablet',
      imagePath: 'assets/images/Iphone1pro.jpg',
      list: itemsPhone
    ),
    Promotion(
      tag: 'Computer',
      imagePath: 'assets/images/mac.jpg',
      list: itemsComputer
    ),
    Promotion(
      tag: 'Camera & Equipments',
      imagePath: 'assets/images/nikonApha11.jpg',
      list: itemsCameras
    ),
  ];
  static List<Promotion> clothing = [
    Promotion(
        tag: 'Phone and Tablet',
        imagePath: 'assets/images/Iphone1pro.jpg',
        list: itemsPhone
    ),
    Promotion(
        tag: 'Computer',
        imagePath: 'assets/images/mac.jpg',
        list: itemsComputer
    ),
    Promotion(
        tag: 'Camera & Equipments',
        imagePath: 'assets/images/nikonApha11.jpg',
        list: itemsCameras
    ),
  ];
  static List<Promotion> book = [
    Promotion(
        tag: 'Phone and Tablet',
        imagePath: 'assets/images/Iphone1pro.jpg',
        list: itemsPhone
    ),
    Promotion(
        tag: 'Computer',
        imagePath: 'assets/images/mac.jpg',
        list: itemsComputer
    ),
    Promotion(
        tag: 'Camera & Equipments',
        imagePath: 'assets/images/nikonApha11.jpg',
        list: itemsCameras
    ),
  ];
  static List<Promotion> sport = [
    Promotion(
        tag: 'Phone and Tablet',
        imagePath: 'assets/images/Iphone1pro.jpg',
        list: itemsPhone
    ),
    Promotion(
        tag: 'Computer',
        imagePath: 'assets/images/mac.jpg',
        list: itemsComputer
    ),
    Promotion(
        tag: 'Camera & Equipments',
        imagePath: 'assets/images/nikonApha11.jpg',
        list: itemsCameras
    ),
  ];

  static List<Promotion> promotions = [
    Promotion(title: 'All item \nDiscount up to',
      subtitle: '50%',
      tag: '3 April 2022',
      imagePath: 'assets/images/sonyPro.jpg',
      caption: '',
    ),
    Promotion(
      title: 'Git voucher gift',
      subtitle: '500000R',
      caption: 'for new member\'s\nof NamaKala',
      tag: '',
      imagePath: 'assets/images/simpleBackground.jpg',
    )
  ];


  static List<Item> itemsPhone = [
    Item(originalPrice: 5500000000,
        discount: 4,
        imagePath: 'assets/images/galaxy S 21.jpg',
        name: 'Samsung Galaxy S21 512gb memory 12gb ram',
        rating: 4.3
    ),
    Item(originalPrice: 3200000000,
        discount: 10,
        imagePath: 'assets/images/Iphone1pro.jpg',
        name: 'Iphone 12 pro max 256gb Memory 6gb Ram',
        rating: 4.5
    ),
    Item(originalPrice: 800000000,
        discount: 2,
        imagePath: 'assets/images/XiamoM11.jpg',
        name: 'Xiaomi M11 lite 256 gb memory 8 gb rma',
        rating: 4.6
    ),
    Item(originalPrice: 100000000,
        discount: 4,
        imagePath: 'assets/images/Nokia.jpg',
        name: 'Nokia R12 ',
        rating: 4.0
    )

  ];
  static List<Item> itemsComputer = [
    Item(originalPrice: 5500000000,
        discount: 4,
        imagePath: 'assets/images/mac.jpg',
        name: 'mac air 2020',
        rating: 4.3
    ),
    Item(originalPrice: 900000000,
        discount: 10,
        imagePath: 'assets/images/desktopDell.jpg',
        name: 'dell 4200  512 GB HDD',
        rating: 4.5
    ),
    Item(originalPrice: 4000000000,
        discount: 2,
        imagePath: 'assets/images/asus.jpg',
        name: 'Asus Legion5 512 GB SSD',
        rating: 4.6
    ),

    Item(originalPrice: 1000000000,
        discount: 4,
        imagePath: 'assets/images/dell5440.jpg',
        name: 'Dell latitude 5440 512GB HDD',
        rating: 4.0
    )
  ];
  static List<Item> itemsCameras = [
    Item(originalPrice: 5500000000,
        discount: 4,
        imagePath: 'assets/images/nikonApha11.jpg',
        name: 'Nikon Alpha 2020',
        rating: 4.3
    ),
    Item(originalPrice: 900000000,
        discount: 10,
        imagePath: 'assets/images/lenseP8sony.jpg',
        name: 'Lens P8 Sony',
        rating: 4.5
    ),
    Item(originalPrice: 4000000000,
        discount: 2,
        imagePath: 'assets/images/canonEosR6.jpg',
        name: 'Canon EOS R6 ',
        rating: 4.6
    ),

    Item(originalPrice: 1000000000,
        discount: 4,
        imagePath: 'assets/images/omlympusProB4.jpg',
        name: 'Olympus ProB4',
        rating: 4.0
    )
  ];

}
