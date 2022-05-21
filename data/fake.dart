import 'dart:core';
import 'package:flutter/material.dart';
import 'package:shop/models/category.dart';


class Fake{
  static int numberOfItemsInCart = 1;

static List <Category> categories = [
  Category(Icons.phonelink_rounded ,  'Digital'),
  Category(Icons.dry_cleaning , "Fashion and clothing"),
  Category( Icons.book , "Books"),
];

}