import 'item.dart';
import 'dart:convert';

class User{
  String firstName = "";
  String lastName ;
  String password = "";
  String email = "";
  String phoneNumber = "";
  List<Item>? purchases = [];
  List<Item>? myProducts = [];
  List<Item>? favorites = [];

  User({required this.firstName, this.lastName = '',required this.password, required this.email, required this.phoneNumber});

  Map toJson(){
    List<Map>? purchases = this.purchases != null? this.purchases!.map((e) => e.toJson()).toList(): null;
    List<Map>? favorites = this.favorites != null? this.favorites!.map((e) => e.toJson()).toList(): null;
    List<Map>? myProducts = this.myProducts != null? this.myProducts!.map((e) => e.toJson()).toList(): null;
    return{
      'firsName':firstName,
      'lastName':lastName,
      'password': password,
      'email': email,
      'phoneNumber':phoneNumber,
      'purchases': purchases,
      'favorite': favorites,
      'myProducts': myProducts,
    };

  }
  factory User.fromJson(dynamic json) {
    var purchasesJsonList = json['purchases'] as List;
    var favoritesJsonList = json['favorites'] as List;
    var myProductsJsonList = json['myProducts'] as List;
    List<Item> purchases = purchasesJsonList.map((e) => Item.fromJson(e)).toList();
    List<Item> favorites = favoritesJsonList.map((e) => Item.fromJson(e)).toList();
    List<Item> myProducts = myProductsJsonList.map((e) => Item.fromJson(e)).toList();
    User user =  User(firstName: json['firstName'] as String, password: json['password'] as String,
      email: json['email'] as String, phoneNumber: json['phoneNumber'] as String,
    );
    user.myProducts = json['myProducts'] != null ? myProducts: [];
    user.purchases = json['favorites'] != null ? favorites: [];
    user.purchases = json['purchases'] != null ? purchases: [];
    return user;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              firstName == other.firstName &&
              lastName == other.lastName &&
              password == other.password;

  @override
  int get hashCode =>
      firstName.hashCode ^ lastName.hashCode ^ password.hashCode;

  @override
  String toString() {
    return 'firstName: $firstName $lastName, password: $password';
  }
}