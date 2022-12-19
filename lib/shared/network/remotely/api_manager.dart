import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:news_app/models/SourcesResponse.dart';
import 'package:news_app/shared/constants/constants.dart';

class ApiManager{


  Future<SourcesResponse> getSources()async{
    Uri URl=Uri.https(BASE,'/v2/top-headlines/sources',{
      "apiKey": APIKEY
    });
    Response sources = await http.get(URl);
    var json=jsonDecode(sources.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }



}