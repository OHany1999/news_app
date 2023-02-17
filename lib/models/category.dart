import 'package:flutter/material.dart';

class CategoryModel{
  String id;
  String title;
  String image;
  Color colorBG;

  CategoryModel(this.id, this.title, this.image, this.colorBG);
  
  static List<CategoryModel> getCategories(){
    return[
      CategoryModel('sports', 'sports', 'assets/images/ball.png', Color(0xffC91C22)),
      CategoryModel('general', 'General', 'assets/images/Politics.png', Color(0xff003E90)),
      CategoryModel('health', 'Health', 'assets/images/health.png', Color(0xffED1E79)),
      CategoryModel('business', 'Business ', 'assets/images/bussines.png', Color(0xffCF7E48)),
      CategoryModel('entertainment', 'Entertainment', 'assets/images/environment.png', Color(0xff4882CF)),
      CategoryModel('science', 'Science', 'assets/images/science.png', Color(0xffF2D352)),
      CategoryModel('technology', 'Technology', 'assets/images/science.png', Color(0xffC91C22)),
    ];
  }
}