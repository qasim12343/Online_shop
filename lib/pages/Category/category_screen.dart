import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop/data/data.dart';
import 'package:shop/pages/Category/list_screen.dart';
import 'package:shop/widgets/search_bar.dart';
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
        backgroundColor: Colors.amber[50],
        bottomNavigationBar: AppBarBottomNavigation(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBar(),
              Section('Digital products',
                 Data.digital.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title,
                      subtitle: e.subtitle,
                      tag: e.tag,
                      caption: e.caption,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ListScreen(items: e.list!, title: e.tag,)));
                      },
                    );
                  }).toList()),
              Section('clothing & Style',
                  Data.clothing.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title,
                      subtitle: e.subtitle,
                      tag: e.tag,
                      caption: e.caption,
                      onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => ListScreen(items: e.list!, title: e.tag,)));
                      },
                    );
                  }).toList()),

              Section('Books & Stationary',
                  Data.book.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title,
                      subtitle: e.subtitle,
                      tag: e.tag,
                      caption: e.caption,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ListScreen(items: e.list!, title: e.tag,)));
                      },
                    );
                  }).toList()),
              Section('Sport',
                  Data.sport.map((e){
                    return PromotionCard(
                      imagePath: e.imagePath,
                      title: e.title,
                      subtitle: e.subtitle,
                      tag: e.tag,
                      caption: e.caption,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => ListScreen(items: e.list!, title: e.tag,)));
                      },
                    );
                  }).toList()),
            ],
          ),
        ),
      ),
    );
  }
}
