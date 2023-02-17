import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/screens/categories/category_item.dart';

import '../drawer/drawer_widget.dart';

class CategoriesScreen extends StatelessWidget {
  static const String RouteName = 'category';

  Function callback;
  CategoriesScreen(this.callback);

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> category = CategoryModel.getCategories();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick your category \n of interest',
          style: TextStyle(
              color: Color.fromRGBO(112, 112, 112, 1.0),
              fontSize: 23,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
            ),
            itemCount: category.length,
            itemBuilder: (context, index) => InkWell(
              onTap: (){
                callback(category[index]);
              },
                child: CategoryItem(category[index],index),
            ),
          ),
        ),
      ],
    );
  }
}
