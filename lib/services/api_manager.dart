// import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/constants/strings.dart';
import 'package:rest_api/model/newsinfo.dart';

class API_Manager {
  Future<NewsModel> getNews() async {
    // var client = HttpClient();
    var url = Uri.parse(Strings.news_url);
    var newsModel;
    // try {
    var response = await http.get(url); //to get the news url
    debugPrint(response.body);
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) //for success status
    {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString); //imported libraray dart: convert
      newsModel = NewsModel.fromJson(jsonMap);
      return newsModel;
    }
    // } catch (e) {
    //   debugPrint("Error has occured");
    //   return newsModel;
    // }
    return newsModel;
  }
}
