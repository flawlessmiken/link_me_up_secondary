import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/models/complete_profile_response.dart';
import 'package:link_me_up_secondary/api/core/models/create_admin_profile_response.dart';
import 'package:link_me_up_secondary/api/core/models/country_model.dart';
import 'package:link_me_up_secondary/api/core/models/create_business_profile_response.dart';
import 'package:link_me_up_secondary/api/core/models/login_model.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/base_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../locator.dart';
import '../../../ui/mixin/responsive_state/view_state.dart';
import '../../../ui/mixin/validators.dart';
import '../../api_utils/network_exception.dart';
import '../../authentication_api/authentication_api.dart';
import '../infastructure/countries_parser.dart';
import '../models/forgot_password_validate_OTP.dart';

class AuthRepository extends BaseNotifier with Validators {
  List<Country> _allCountries = [];
  var authApi = locator<AUthenticationApi>();

  //models
  CreateAdminProfileResponse createAdminProfileResponse =
      CreateAdminProfileResponse();
  CreateBusinessProfileResponse createBusinessProfileResponse =
      CreateBusinessProfileResponse();

  CompleteProfileResponse completeProfileResponse = CompleteProfileResponse();
  LoginModel loginModel = LoginModel();
  ValidateForgotPasswordOtp validateForgotPasswordOtp =
      ValidateForgotPasswordOtp();

  Country? selectedCountry;
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

  void setCountry({String? countryString}) {
    if (countryString != null)
      selectedCountry =
          _allCountries.where((element) => element.name == countryString).first;
    notifyListeners();
  }

  Future<bool> Login(String email, String password) async {
    setState(ViewState.Busy);
    try {
      loginModel = await authApi.login(email: email, password: password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", loginModel.data!.token!);
      prefs.setString("userID", loginModel.data!.userId!);

      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
      displayError(
          error: 'Error!',
          message: e.toString());
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> createAdminDetails(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String password,
    String profilePicture,
  ) async {
    setState(ViewState.Busy);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      createAdminProfileResponse = await authApi.createAdminProfile(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
          profilePicture: profilePicture);
      prefs.setString("userID", createAdminProfileResponse.data!.userId!);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
      displayError(error: 'Error!', message: e.toString());
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> createPin(
    String pin,
    String confirmPin,
  ) async {
    setState(ViewState.Busy);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userID = prefs.getString("userID")!;
    try {
      await authApi.createPin(
        userId: userID,
        pin: pin,
        confirmPin: confirmPin,
      );
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> validateOTP(
    String email,
    String otpCode,
  ) async {
    setState(ViewState.Busy);
    try {
      await authApi.validateOTP(email: email, otpCode: otpCode);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> resendOTP(
    String email,
  ) async {
    setState(ViewState.Busy);
    try {
      await authApi.resendOTP(email: email);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> createBusinessProfile(
    String category,
    String name,
    String postalCode,
    String address,
    String email,
    String phoneNumber,
    String website,
  ) async {
    setState(ViewState.Busy);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      createBusinessProfileResponse = await authApi.createBusinessProfile(
          category: category,
          name: name,
          postalCode: postalCode,
          address: address,
          email: email,
          phoneNumber: phoneNumber,
          website: website);

      prefs.setString(
          "accountID", createBusinessProfileResponse.data!.accountId!);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> addPictureAndNameTag(String nameTag, String companyLogo) async {
    setState(ViewState.Busy);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userID = prefs.getString("userID")!;
      String accountID = prefs.getString("accountID")!;

      completeProfileResponse = await authApi.addPictureAndNameTag(
          accountId: accountID,
          nameTag: nameTag,
          adminId: userID,
          companyImage: companyLogo);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> forgotPassword(String email) async {
    setState(ViewState.Busy);
    try {
      await authApi.forgotPassword(email: email);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> validateForgotPasswordOTP(String email, String otpCode) async {
    setState(ViewState.Busy);
    try {
      validateForgotPasswordOtp = await authApi.forgotPasswordValidateOTP(
          email: email, OTPcode: otpCode);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  Future<bool> validateForgotPasswordPIN( String pin) async {
    setState(ViewState.Busy);
    try {
      await authApi.forgotPasswordValidatePin(userId: validateForgotPasswordOtp.data!.userId!, pin: pin);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);
    return false;
  }

  Future<bool> changePassword(
      String newPassword, String confirmPassword) async {
    setState(ViewState.Busy);
    try {
      await authApi.changePassword(
          confirmNewPassword: confirmPassword,
          newPassword: newPassword,
          userId: validateForgotPasswordOtp.data!.userId!);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      print(e);
    }
    setState(ViewState.Idle);

    return false;
  }

  SnackbarController displayError(
      {required String error, required String message}) {
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
