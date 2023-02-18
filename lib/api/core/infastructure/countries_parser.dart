
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../models/country_model.dart';



class CountriesParser extends ChangeNotifier{
  List<Country> countries =[];
  // Fetch content from the json file
  static Future<List<Country>> readJson() async {
    final String response = await rootBundle.loadString('assets/countries.json');
    print('this is the response $response');
    final List<Country> countries = countryFromJson(response);
    countries.sort((a,b) => a.name!.compareTo("${b.name}"));
    return countries;
  }

  Future<List<Country>> loadCountries() async{
    List<Country> data = await readJson();
    countries = data;
    notifyListeners();
    return countries;
  }
}