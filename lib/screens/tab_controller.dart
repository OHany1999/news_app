import 'package:flutter/material.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/screens/new_item.dart';
import 'package:news_app/screens/tab_item.dart';
import 'package:news_app/shared/network/remotely/api_manager.dart';

import '../models/SourcesResponse.dart';

class TabControllerScreen extends StatefulWidget {
  List<Sources> sources;
  TabControllerScreen(this.sources);

  @override
  State<TabControllerScreen> createState() => _TabControllerScreenState();
}

class _TabControllerScreenState extends State<TabControllerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            isScrollable: true,
            labelColor: Colors.blue,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sources
                .map((element) => TabItem(
                    element,
                    //اللي بعد اليساوي دي indexof بتديها الitem تقولك هو رقم كام في الlist
                    selectedIndex == widget.sources.indexOf(element)
                        ? true
                        : false))
                .toList(),
          ),
          FutureBuilder<NewsResponse>(
              future: ApiManager.getNews(widget.sources[selectedIndex].id!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      children: [
                        Text('Something went wrong'),
                        TextButton(
                          onPressed: () {},
                          child: Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                }
                if (snapshot.data!.status != 'ok') {
                  return Center(
                    child: Column(
                      children: [
                        Text(snapshot.data?.message ?? ''),
                        TextButton(
                          onPressed: () {},
                          child: Text('Try Again'),
                        ),
                      ],
                    ),
                  );
                }
                var news = snapshot.data?.articles ?? [];
                return Expanded(
                  child: ListView.builder(
                      itemCount: news.length,
                      itemBuilder: (context, index) =>
                          NewsItem(news[index]),
                ),
                );
              })
        ],
      ),
    );
  }
}
