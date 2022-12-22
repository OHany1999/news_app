import 'package:flutter/material.dart';
import 'package:news_app/screens/drawer/drawer_widget.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/shared/network/remotely/api_manager.dart';
import '../models/SourcesResponse.dart';
import '../models/category.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home';


  @override
  Widget build(BuildContext context) {
    CategoryModel args = ModalRoute.of(context)!.settings.arguments as CategoryModel;

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
        body: HomeScreen(args),
      ),
    );
  }
}
