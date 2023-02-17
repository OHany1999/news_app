import 'package:flutter/material.dart';
import 'package:news_app/screens/categories/categories_screen.dart';
import 'package:news_app/screens/drawer/drawer_widget.dart';
import 'package:news_app/screens/news/news_screen.dart';
import '../models/category.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {

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
        body: currentSelectedItem == null? CategoriesScreen(returnFunction): NewsScreen(currentSelectedItem!),
      ),
    );
  }

  CategoryModel? currentSelectedItem = null;

  void returnFunction(CategoryModel category){
    currentSelectedItem = category;
    setState(() {});
  }
}
