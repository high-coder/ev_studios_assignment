import 'dart:convert';

import 'package:ev_studios_assignment/models/apiDataModel.dart';
import 'package:http/http.dart' as http;

class DataService{


  Future<List<ApiDataModel>> getMainApiData() async{
    List<ApiDataModel> allData = [];
    var response = await http.get(Uri.parse("https://api.sampleapis.com/futurama/characters"));
    if(response.statusCode==200) {
      List data= jsonDecode(response.body);
      print(response.body);
      print(data);
      for (var element in data) {
        allData.add(ApiDataModel.fromJson(element));
      }
    }
    else{
      ///something went wrong
      print("Something went wrong");
    }

    return allData;
  }
}