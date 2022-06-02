import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterList extends StatefulWidget {
  final Function(List<String>) onSelected;
  const FilterList({Key? key, required this.onSelected}) : super(key: key);

  @override
  _FilterListState createState() => _FilterListState();
}

class _FilterListState extends State<FilterList> {
  List<String> selected = [];
  List<dynamic> options = [
    {
      'icon' : SvgPicture.asset('assets/icons/tag.svg'),
      'title' : 'Discount'
    },
    {
      'icon' : SvgPicture.asset('assets/icons/delivery.svg',height: 24,  width: 24,),
      'title' : 'Free Delivery'
    },
    {
      'icon' : SvgPicture.asset('assets/icons/card.svg'),
      'title' : 'Installment Plan'
    },
  ];
  toggle(title){
    if(selected.contains(title)) {
      selected.remove(title);
    } else {
      selected.add(title);
    }
      setState(() {
        widget.onSelected(selected);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.map((e){
        return FilterListItem(
          icon: e['icon'],
          onTap: () {
            toggle(e['title']);
          },
          title: e['title'],
          selected: selected.contains(e['title']),
        );
      }).toList(),
    );
  }
}

class FilterListItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final bool selected;
  final Function() onTap;

  const FilterListItem({
    Key? key, required this.title, required this.icon,this.selected = false,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black26,
              width: 1
            )
          )
        ),
        child: Row(
          children: [
            icon,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(title, style: TextStyle(fontSize: 16),),
              ),
            ),
            if(selected)
            Icon(Icons.check,color: Colors.green,)
          ],
        ),
      ),
    );
  }
}
