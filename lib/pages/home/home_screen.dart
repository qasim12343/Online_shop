import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/pages/Category/list_screen.dart';
import 'package:shop/widgets/app_bottom_navigation.dart';
import 'package:shop/pages/home/widgets/category_card.dart';
import 'package:shop/pages/home/widgets/header.dart';
import 'package:shop/widgets/promotion_card.dart';
import 'package:shop/pages/home/widgets/section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              Section("Categories",
                  Data.categories.map((e){
                    return CategoryCard(title: e.title, imagePath: e.imagePath,
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ListScreen() ));

                        });
                  }).toList()
              ),
              Section('Today\'s Promo', Data.promotions.map((e){
                return PromotionCard(
                  imagePath: e.imagePath,
                  title: e.title!,
                   subtitle: e.subtitle!,
                  tag: e.tag!,
                  caption: e.caption!, onTap: () {  },
                );
              }).toList()),
              // Section('Trending Furniture ',Data.trend.map((e) => ImageCard(imagePath: e,)).toList()),
              // Section('Best Sales ', Data.bests.map((e) => ImageCard( imagePath: e,)).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
