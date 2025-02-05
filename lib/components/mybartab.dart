import 'package:balirental_project1/components/data/transportation.dart';
import 'package:flutter/material.dart';

class Mybartab extends SliverPersistentHeaderDelegate {
  final TabController tabController;
  const Mybartab({required this.tabController});

  List<Widget> _categoryTabs() {
    return transportationCategory.values.map(
      (category) {
        int index = transportationCategory.values.toList().indexOf(category);
        bool isSelectedIndex = tabController.index == index;

        return Container(
          decoration: BoxDecoration(
            color: isSelectedIndex ? Colors.white : Colors.indigo.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 105,
          padding: EdgeInsets.all(10),
          child: Tab(
            text: category.toString().split('.').last,
          ),
        );
      },
    ).toList();
  }

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TabBar(
        dividerColor: Colors.transparent,
        physics: BouncingScrollPhysics(),
        indicatorColor: Colors.transparent,
        labelStyle: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        tabs: _categoryTabs(),
        controller: tabController,
        isScrollable: true,
      ),
    );
  }

  @override
  double get maxExtent =>
      80.0; // Ukuran tinggi saat header dalam keadaan maksimal
  @override
  double get minExtent =>
      80.0; // Ukuran tinggi saat header dalam keadaan minimal

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
