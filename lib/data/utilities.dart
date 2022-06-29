import 'dart:convert';
import 'dart:io';
import 'package:shop/data/promotion.dart';
import 'package:shop/data/user.dart';
import 'category.dart';
import 'data.dart';

class Utilities{
  String objToJsonString(var data){
    return jsonEncode(data);
  }
  dynamic stringToObj(String data){
    return User.fromJson(jsonDecode(data));
  }
  List<User> stringToListUser(String data){
    var list = jsonDecode(data) as List;
    List<User>? users = list.map((e) => User.fromJson(e)).toList();
    return users;
  }
  List<Promotion> stringToListPromotion(String data){
    var list = jsonDecode(data) as List;
    List<Promotion>? promotions = list.map((e) => Promotion.fromJson(e)).toList();
    return promotions;
  }
  List<Category> stringToListCategory(String data){
    var list = jsonDecode(data) as List;
    List<Category>? categories = list.map((e) => Category.fromJson(e)).toList();
    return categories;
  }
  void todo(){
    if(Data.jsonString != ''){
      Data.users = Utilities().stringToListUser(Data.jsonString);
    }
  }
  send() async {
    String data = objToJsonString(Data.users);
    String request = "send\n$data\u0000";

    await Socket.connect("172.20.170.149",4040).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        String.fromCharCodes(response);
      });
    });
  }
  get() async{
    String request = "get\u0000";

    await Socket.connect("172.20.170.149",4040).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        print(String.fromCharCodes(response));
        Data.jsonString = String.fromCharCodes(response);
      });
    });
  }
}