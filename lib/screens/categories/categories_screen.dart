import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/category.dart';
import 'package:news_app/screens/categories/category_item.dart';

import '../drawer/drawer_widget.dart';

class CategoriesScreen extends StatelessWidget {
  static const String RouteName = 'category';
  @override
  Widget build(BuildContext context) {

    List<CategoryModel> list = CategoryModel.getCategories();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/pattern.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
            elevation: 0,
            shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            title: Text('News'),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
        ),
        drawer: DrawerWidget(),
        body: Column(
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
                itemCount: list.length,
                itemBuilder: (context, index) => CategoryItem(list[index],index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
