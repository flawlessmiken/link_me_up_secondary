import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:link_me_up_secondary/api/api_utils/api_helper.dart';
import 'package:link_me_up_secondary/api/authentication_api/authentication_api.dart';
import 'package:link_me_up_secondary/api/models/api_response.dart';
import 'package:link_me_up_secondary/api/models/complete_profile_response.dart';
import 'package:link_me_up_secondary/api/models/create_admin_profile_response.dart';
import 'package:link_me_up_secondary/api/models/create_business_profile_response.dart';
import 'package:link_me_up_secondary/api/models/forgot_password_validate_OTP.dart';
import 'package:link_me_up_secondary/api/models/login_model.dart';
import 'package:link_me_up_secondary/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_utils/api_routes.dart';

class AUthenticationApiImplementation implements AUthenticationApi {
  Map<String, String> get header => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  Map<String, String> get mediaHeader => {
        'Accept': 'application/json',
        // 'Content-Type': 'application/json',
        //'Authorization': 'Bearer ${locator<UserInfoCache>().token}',
      };

  var server = locator<API>();

  @override
  Future<CompleteProfileResponse> addPictureAndNameTag(
      {String? accountId,
      String? nameTag,
      String? adminId,
      String? companyImage}) async {
    FormData formData;
    MultipartFile companyLogo;
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, dynamic> val = {
      "accountId": accountId,
      "nameTag": nameTag,
      "adminId": adminId,
    };

    Map<String, dynamic> noMediaReq = {}..addAll(val);

    companyLogo = await MultipartFile.fromFile(
      companyImage!,
      filename: '$id/${companyImage}',
    );

    formData = FormData.fromMap(val..addAll({"picture": companyLogo}));

    log("${companyLogo.filename} $accountId $nameTag, $adminId");

    var responsebody = await server.post(
        ApiRoutes.addPictureAndNameTag, header, noMediaReq,
        multimediaRequest: formData);
    CompleteProfileResponse response =
        completeProfileResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<CreateAdminProfileResponse> createAdminProfile(
      {String? firstName,
      String? lastName,
      String? phoneNumber,
      String? email,
      String? password,
      String? profilePicture}) async {
    FormData formData;
    MultipartFile adminPicture;
    String id = DateTime.now().millisecondsSinceEpoch.toString();

    Map<String, dynamic> val = {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "confirmPassword": password,
    };

    Map<String, dynamic> noMediaReq = {}..addAll(val);

    adminPicture = await MultipartFile.fromFile(
      profilePicture!,
      filename: '$id/${profilePicture}',
    );

    log("${adminPicture.filename} $password");

    formData = FormData.fromMap(val..addAll({"profilePicture": adminPicture}));

    var responsebody = await server.post(
        ApiRoutes.createAdminDetails, header, noMediaReq,
        multimediaRequest: formData);
    CreateAdminProfileResponse response =
        createAdminProfileResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<LoginModel> login({String? email, String? password}) async {
    Map val = {
      "email": email,
      "password": password,
    };
    var responsebody =
        await server.post(ApiRoutes.login, header, jsonEncode(val));
    LoginModel response = loginModelFromJson(responsebody);
    return response;
  }

  @override
  Future<CreateBusinessProfileResponse> createBusinessProfile(
      {String? category,
      String? name,
      String? postalCode,
      String? address,
      String? email,
      String? phoneNumber,
      String? website}) async {
    Map<String, dynamic> val = {
      "category": category,
      "name": name,
      "postalCode": postalCode,
      "address": address,
      "email": email,
      "phoneNumber": phoneNumber,
      "website": website,
    };

    var responsebody = await server.post(
        ApiRoutes.createBusinessProfile, header, jsonEncode(val));
    CreateBusinessProfileResponse response =
        createBusinessProfileResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> createPin(
      {String? userId, String? pin, String? confirmPin}) async {
    Map val = {
      "userId": userId,
      "pin": pin,
      "confirmPin": confirmPin,
    };
    var responsebody =
        await server.post(ApiRoutes.createPin, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> validateOTP({
    String? email,
    String? otpCode,
  }) async {
    var responsebody = await server.get(
        "${ApiRoutes.validOTP}?email=$email&code=$otpCode", header);
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> resendOTP({String? email}) async {
    Map val = {
      "email": email,
    };
    var responsebody =
        await server.post(ApiRoutes.resendOTP, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> changePassword(
      {String? userId, String? newPassword, String? confirmNewPassword}) async {
    Map val = {
      "userId": userId,
      "newPassword": newPassword,
      "confirmNewPassword": confirmNewPassword,
    };
    log("$userId $newPassword $confirmNewPassword");
    var responsebody = await server.post(
        ApiRoutes.forgotPasswordChangePassword, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> forgotPassword({String? email}) async {
    Map val = {
      "email": email,
    };
    var responsebody =
        await server.post(ApiRoutes.forgotPassword, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ValidateForgotPasswordOtp> forgotPasswordValidateOTP(
      {String? email, String? OTPcode}) async {
    Map val = {
      "email": email,
      "OTPcode": email,
    };

    log("$email  $OTPcode");
    var responsebody = await server.get(
        "${ApiRoutes.forgotPasswordValidateOTP}?email=$email&code=$OTPcode",
        header);
    ValidateForgotPasswordOtp response =
        validateForgotPasswordOtpFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> forgotPasswordValidatePin(
      {String? userId, String? pin}) async {
    Map val = {
      "userId": userId,
      "pin": pin,
    };

    var responsebody = await server.post(
        ApiRoutes.forgotPasswordValidatePIN, header, jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }
}
