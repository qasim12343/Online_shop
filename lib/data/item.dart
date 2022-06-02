class Item {
  String name;
  String imagePath;
  int discount;
  double originalPrice;
  double rating;
  bool isMine;

  Item({required this.name, required this.imagePath, required this.discount, required this.originalPrice,
      required this.rating,this.isMine = false});
  double get Price{
    return discount != 0 ? (originalPrice -(originalPrice*discount/100)):(originalPrice);
  }
  static String format(double price){
    return price.toStringAsFixed(2)+'R';
  }
}