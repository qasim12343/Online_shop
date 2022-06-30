import 'dart:convert';
import 'dart:io';
import 'package:shop/data/obj_data.dart';
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
  ObjData stringToObjLists(String data){
    return ObjData.fromJson(jsonDecode(data));
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
    if(Data.usersJsonString != ''){
      Data().setUsers(Utilities().stringToListUser(Data.usersJsonString));
    }
    if(Data.listsJsonString != ''){
      Data.obj = Utilities().stringToObjLists(Data.listsJsonString);
    }
  }
  send(String field) async {

    String data = field == 'Users'? objToJsonString(Data.users): objToJsonString(Data.obj);
    String request = "send$field\n$data\u0000";

    await Socket.connect("172.20.170.149",4040).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        String.fromCharCodes(response);
      });
    });
  }
  get(String field) async{
    String request = "get$field\u0000";

    await Socket.connect("172.20.170.149",4040).then((serverSocket){
      serverSocket.write(request);
      serverSocket.flush();
      serverSocket.listen((response) {
        String res = String.fromCharCodes(response);
        if(field == "Users") {
          Data.usersJsonString = res;
        } else {
          Data.listsJsonString = res;
        }
      });
    });
  }
}