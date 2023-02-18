import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/models/country_model.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/base_view_model.dart';

import '../../../ui/mixin/responsive_state/view_state.dart';
import '../../../ui/mixin/validators.dart';
import '../infastructure/countries_parser.dart';




class AuthRepository extends BaseNotifier with Validators {
   List<Country> _allCountries = [];
  Country ?selectedCountry;
  Future<List<Country>?> getCountries() async {
    try {
      setState(ViewState.Busy);
      CountriesParser m = CountriesParser();
      var countries = await m.loadCountries();
      _allCountries = countries;
      //selectedCountry = _allCountries[0];
      setCountry(countryString: 'Nigeria');
      countriesListBuilder(countries);
      setState(ViewState.Idle);
      return countries;
    } catch (e) {
      displayError(error: 'An Error Occurred!', message: e.toString());
    }
    setState(ViewState.Idle);
    return null;
  }

  List<String> _allCountriesString = [];
  List<String> get allCountries => _allCountriesString;

  List<String> countriesListBuilder(List<Country> countries) {
    final List<String> items = [];
    if (items != null) {
      for (var country in countries) {
        items.add(country.name!);
      }
      _allCountriesString = items;
    } else {
      items.add('Null');
    }
    return items;
  }

  void setCountry({String ?countryString}) {
    if (countryString != null)
      selectedCountry =
          _allCountries.where((element) => element.name == countryString).first;
    notifyListeners();
  }

  SnackbarController displayError({required String error,required String message}) {
    SnackbarController controller = Get.snackbar(
      error,
      message,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.BOTTOM,
      // colorText: const Color(0xffF72585),
      // backgroundColor: const Color(0xff3F37C9).withOpacity(.75),
    );
    return controller;
  }
}