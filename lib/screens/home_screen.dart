import 'package:flutter/material.dart';
import 'package:news_app/screens/tab_controller.dart';

import '../models/SourcesResponse.dart';
import '../shared/network/remotely/api_manager.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
        future: ApiManager.getSources(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(
              child: Column(
                children: [
                  Text('Something went wrong'),
                  TextButton(onPressed: (){}, child: Text('Try Again'),),
                ],
              ),
            );
          }
          if(snapshot.data!.status != 'ok'){
            return Center(
              child: Column(
                children: [
                  Text(snapshot.data?.message ?? ''),
                  TextButton(onPressed: (){}, child: Text('Try Again'),),
                ],
              ),
            );
          }
          var sourcesList= snapshot.data!.sources??[];
          return TabControllerScreen(sourcesList);

        }
    );
  }
}
