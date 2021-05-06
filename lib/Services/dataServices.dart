import 'dart:convert';
import 'package:api_demo/Model/factResponse.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataServices{
  Future<FactsResponse>getData()async{

    http.Response response; //here Responce is data type and response is the variable store hhtp store
    response = await http.get(Uri.parse("https://thegrowingdeveloper.org/apiview?id=2")); //this is for map data
    if(response.statusCode == 200){  //200 means successful
      print(response.statusCode);
      FactsResponse factsResponse = FactsResponse.fromJson(json.decode(response.body));
      return factsResponse;

    }
    else{
      return null;
    }
  }
}