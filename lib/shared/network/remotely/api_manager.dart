import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/shared/constants/constants.dart';

import '../../../models/NewsResponse.dart';

class ApiManager{


  static Future<SourcesResponse> getSources(String categoryId)async{
    Uri URl=Uri.https(BASE,'/v2/top-headlines/sources',{
      "apiKey": APIKEY,
      'category':categoryId
    });
    Response sources = await http.get(URl);
    try{
      var json=jsonDecode(sources.body);
      SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
      return sourcesResponse;
    }
    catch(error){
      print("error is : $error");
      throw error;
    }

  }

  static Future<NewsResponse> getNews(String sourceId)async{
    Uri url = Uri.https(BASE, 'v2/everything',{
      'apiKey' : APIKEY,
      'sources' : sourceId,
    });

    Response newsData = await http.get(url);
    try{
      var json = jsonDecode(newsData.body);
      NewsResponse newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    }
    catch(error){
      print('error is: $error');
      throw error;
    }
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=585a68efe3494c7b8b2cd95bc5f156e1

}