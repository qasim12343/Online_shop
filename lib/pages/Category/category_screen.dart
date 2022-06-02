import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/pages/home/widgets/section.dart';
import 'package:shop/widgets/app_bottom_navigation.dart';
import 'package:shop/pages/home/widgets/header.dart';
import 'package:shop/widgets/promotion_card.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override

  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  Data fake = Data();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: AppBarBottomNavigation(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              Section('Digital products',
                 Data.promotions.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title!,
                      subtitle: e.subtitle!,
                      tag: e.tag!,
                      caption: e.caption!, onTap: () { Navigator.pushNamed(context, '/list'); },
                    );
                  }).toList()),
              Section('Clothing & Style',
                  Data.promotions.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title!,
                      subtitle: e.subtitle!,
                      tag: e.tag!,
                      caption: e.caption!, onTap: () { Navigator.pushNamed(context, '/list'); },
                    );
                  }).toList()),
              Section('Books & Stationary',
                  Data.promotions.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title!,
                      subtitle: e.subtitle!,
                      tag: e.tag!,
                      caption: e.caption!, onTap: () { Navigator.pushNamed(context, '/list'); },
                    );
                  }).toList()),
              Section('Sport',
                  Data.promotions.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title!,
                      subtitle: e.subtitle!,
                      tag: e.tag!,
                      caption: e.caption!, onTap: () { Navigator.pushNamed(context, '/list'); },
                    );
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
