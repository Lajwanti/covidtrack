import 'dart:convert';

import 'package:covidtrack/Model/WorldStateModel.dart';

import 'package:covidtrack/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StateServices {
  Future<WorldStateModel> fetchWorldStatesRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    //var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
     var data = jsonDecode(response.body);
      return WorldStateModel.fromJson(data);
    } else {
     throw Exception("Error");

    }
  }

  Future<List<dynamic>> fetchWorldCountryRecords() async {
    final response = await http.get(Uri.parse(AppUrl.worldCountriesApi));
    var data ;
    if (response.statusCode == 200) {
       data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception("Error");

    }
  }
}
