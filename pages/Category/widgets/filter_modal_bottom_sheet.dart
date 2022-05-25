import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterModalBottomSheet extends StatelessWidget {
  const FilterModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Container(
              alignment: Alignment.centerLeft,
              width: 100,
              padding: EdgeInsets.all(4),
              child: InkWell(
                child: Icon(Icons.close),
                onTap: (){
                  Navigator.pop(context);
                },
              ),
            ),
            Text('Filter',textAlign: TextAlign.center,),
            Container(
              width: 100,
              alignment: Alignment.centerRight,
              child: InkWell(
                child: Text('Reset',textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue),),
                onTap: (){
                },
                ),
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text('Price Range', style: TextStyle(fontSize: 20),),
          ),
          Container(
            width: double.infinity,
            child: Wrap(
              children: [
                Container(
                  width: ((size.width/2) - 55),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.black26 ),
                  ),

                )
              ],
            ),
          )

        ],
      ),
    );
  }
}
