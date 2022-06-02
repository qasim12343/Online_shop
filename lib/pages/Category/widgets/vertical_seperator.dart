import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      color: Colors.grey[600],
    );
  }
}