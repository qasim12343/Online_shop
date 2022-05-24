import 'package:flutter/cupertino.dart';
import 'package:flutter/src/rendering/sliver_persistent_header.dart';

import 'header_h.dart';

class HeaderSliver implements SliverPersistentHeaderDelegate{
  final double minExtent;
  final double maxExtent;

  HeaderSliver({required this.minExtent, required this.maxExtent});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return HeaderH();
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration => null;

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override

  TickerProvider? get vsync => null;

}