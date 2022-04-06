import 'package:ev_studios_assignment/models/apiDataModel.dart';
import 'package:flutter/cupertino.dart';

import '../services/dataFetchingService.dart';

class CurrentState extends ChangeNotifier {

  List<ApiDataModel> apiData = [];
  getData() async{
    apiData.clear();
    apiData = await DataService().getMainApiData();
    print(apiData.length);
    notifyListeners();
  }


}