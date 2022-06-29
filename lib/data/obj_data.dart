import 'package:shop/data/promotion.dart';
import 'category.dart';
import 'item.dart';


class ObjData{
  List<Category> categories ;
  List<Promotion> digital;
  List<Promotion> clothing;
  List<Promotion> book;
  List<Promotion> sport;
  List<Promotion> promotions;
  List<Item> itemsPhone;
  List<Item> itemsComputer;
  List<Item> itemsCameras;
  List<Item> itemsMen;
  List<Item> itemsWomen;
  List<Item> itemsKids;
  List<Item> itemsMusic;
  List<Item> itemsBook;
  List<Item> itemsStationary;
  List<Item> itemsSportClothing;
  List<Item> itemsEquipment;
  List<Item> itemsTravel;


  ObjData({ required this.categories, required this.digital, required this.clothing, required this.book,
    required this.sport, required this.promotions, required this.itemsPhone, required this.itemsComputer,
    required this.itemsCameras, required this.itemsMen, required this.itemsWomen, required this.itemsKids,
    required this.itemsMusic, required this.itemsBook, required this.itemsStationary,
    required this.itemsSportClothing,required this.itemsEquipment,required this.itemsTravel
  });

  Map toJson(){
    List<Map>? categories = this.categories.map((e) => e.toJson()).toList();
    List<Map>? digital = this.digital.map((e) => e.toJson()).toList();
    List<Map>? clothing = this.clothing.map((e) => e.toJson()).toList();
    List<Map>? book = this.book.map((e) => e.toJson()).toList();
    List<Map>? sport = this.sport.map((e) => e.toJson()).toList();
    List<Map>? promotions = this.promotions.map((e) => e.toJson()).toList();
    List<Map>? itemsPhone = this.itemsPhone.map((e) => e.toJson()).toList();
    List<Map>? itemsComputer = this.itemsComputer.map((e) => e.toJson()).toList();
    List<Map>? itemsCameras = this.itemsCameras.map((e) => e.toJson()).toList();
    List<Map>? itemsMen = this.itemsMen.map((e) => e.toJson()).toList();
    List<Map>? itemsWomen = this.itemsWomen.map((e) => e.toJson()).toList();
    List<Map>? itemsKids = this.itemsKids.map((e) => e.toJson()).toList();
    List<Map>? itemsMusic = this.itemsMusic.map((e) => e.toJson()).toList();
    List<Map>? itemsBook = this.itemsBook.map((e) => e.toJson()).toList();
    List<Map>? itemsStationary = this.itemsStationary.map((e) => e.toJson()).toList();
    List<Map>? itemsSportClothing = this.itemsSportClothing.map((e) => e.toJson()).toList();
    List<Map>? itemsEquipment = this.itemsEquipment.map((e) => e.toJson()).toList();
    List<Map>? itemsTravel = this.itemsTravel.map((e) => e.toJson()).toList();
    return{
      'categories': categories,
      'digital': digital,
      'clothing': clothing,
      'book':book,
      'sport' : sport,
      'promotions': promotions,
      'itemsPhone': itemsPhone,
      'itemsComputer': itemsComputer,
      'itemsCameras': itemsCameras,
      'itemsMen': itemsMen,
      'itemsWomen': itemsWomen,
      'itemsKids': itemsKids,
      'itemsMusic':itemsMusic,
      'itemsBook': itemsBook,
      "itemsStationary": itemsStationary,
      "itemsSportClothing": itemsSportClothing,
      "itemsEquipment": itemsEquipment,
      "itemsTravel": itemsTravel,
    };
  }

  factory ObjData.fromJson(dynamic json){
    var categoriesJsonString = json['categories'] as List;
    var digitalJsonString = json['digital'] as List;
    var clothingJsonString = json['clothing'] as List;
    var bookJsonString = json['book'] as List;
    var sportJsonString = json['sport'] as List;
    var promotionsJsonString = json['promotions'] as List;
    var itemsPhoneJsonString = json['itemsPhone'] as List;
    var itemsComputerJsonString = json['itemsComputer'] as List;
    var itemsCamerasJsonString = json['itemsCameras'] as List;
    var itemsMenJsonString = json['itemsMen'] as List;
    var itemsWomenJsonString = json['itemsWomen'] as List;
    var itemsKidsJsonString = json['itemsKids'] as List;
    var itemsMusicJsonString = json['itemsMusic'] as List;
    var itemsBookJsonString = json['itemsBook'] as List;
    var itemsStationaryJsonString = json['itemsStationary'] as List;
    var itemsSportClothingJsonString = json['itemsSportClothing'] as List;
    var itemsEquipmentJsonString = json['itemsEquipment'] as List;
    var itemsTravelJsonString = json['itemsTravel'] as List;

    List<Category> categories = categoriesJsonString.map((e) => Category.fromJson(e)).toList();
    List<Promotion> digital = digitalJsonString.map((e) => Promotion.fromJson(e)).toList();
    List<Promotion> clothing = clothingJsonString.map((e) => Promotion.fromJson(e)).toList();
    List<Promotion> book = bookJsonString.map((e) => Promotion.fromJson(e)).toList();
    List<Promotion> sport = sportJsonString.map((e) => Promotion.fromJson(e)).toList();
    List<Promotion> promotions = promotionsJsonString.map((e) => Promotion.fromJson(e)).toList();
    List<Item> itemsPhone = itemsPhoneJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsComputer = itemsComputerJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsCameras = itemsCamerasJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsMen = itemsMenJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsWomen = itemsWomenJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsKids = itemsKidsJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsMusic = itemsMusicJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsBook = itemsBookJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsStationary = itemsStationaryJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsSportClothing = itemsSportClothingJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsEquipment = itemsEquipmentJsonString.map((e) => Item.fromJson(e)).toList();
    List<Item> itemsTravel = itemsTravelJsonString.map((e) => Item.fromJson(e)).toList();

    return ObjData( categories: categories, digital: digital, clothing: clothing, book: book,
        sport: sport, promotions: promotions, itemsPhone: itemsPhone, itemsComputer: itemsComputer,
        itemsCameras: itemsCameras, itemsMen: itemsMen, itemsWomen: itemsWomen, itemsKids: itemsKids,
        itemsMusic: itemsMusic, itemsBook: itemsBook, itemsStationary: itemsStationary,
        itemsSportClothing: itemsSportClothing, itemsTravel: itemsTravel, itemsEquipment: itemsEquipment);
  }
}