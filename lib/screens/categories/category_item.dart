import 'package:flutter/material.dart';
import 'package:news_app/layout/home_layout.dart';

import '../../models/category.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryList;
  int index;
  CategoryItem(this.categoryList,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: categoryList.colorBG,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight:Radius.circular(15),
          bottomLeft:index %2 == 0 ?Radius.circular(15):Radius.circular(0),
          bottomRight:index %2 != 0 ?Radius.circular(15):Radius.circular(0),
        ),
      ),
      child: Column(
        children: [
          Image.asset(
            categoryList.image,
            height: 120,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            categoryList.title,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
