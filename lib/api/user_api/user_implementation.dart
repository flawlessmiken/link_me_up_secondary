import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:link_me_up_secondary/api/core/models/all_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/api_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';
import 'package:link_me_up_secondary/api/user_api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';
import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../core/models/successfully_added_user_model.dart';

class UserApiImplantation implements UserApi {
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

  Future<Map<String, String>> headerWithToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    Map<String, String> headerToken = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    log("token ||$token ");

    return headerToken;
  }

  var server = locator<API>();

  @override
  Future<UserInfoResponse> fetchUserInfo() async {
    var responsebody =
        await server.get(ApiRoutes.fetchUserInfo, await headerWithToken());
    UserInfoResponse response = userInfoResponseFromJson(responsebody);
    return response;
  }

  @override
  Future<SuccessfullAddedUserModel> addNewUser(
      {String? firstName,
      String? lastName,
      String? phoneNumber,
      String? email,
      String? password,
      String? profilePicture,
      String? role}) async {
    Map<String, dynamic> val = {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "role": role,
      "confirmPassword": password
    };
    FormData formData;
    MultipartFile userPicture;
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> noMediaReq = {}..addAll(val);

    if (profilePicture!.isNotEmpty) {
      userPicture = await MultipartFile.fromFile(
        profilePicture,
        filename: '$id/$profilePicture',
      );

      formData = FormData.fromMap(val..addAll({"profilePicture": userPicture}));

      var responsebody = await server.post(
          ApiRoutes.addNewUser, await headerWithToken(), noMediaReq,
          multimediaRequest: formData);
      SuccessfullAddedUserModel response =
          successfullAddedUserModelFromJson(responsebody);
      return response;
    } else {
      var responsebody = await server.post(
        ApiRoutes.addNewUser,
        await headerWithToken(),
        jsonEncode(val),
      );
      SuccessfullAddedUserModel response =
          successfullAddedUserModelFromJson(responsebody);

      return response;
    }
  }

  @override
  Future<ApiResponse> editUserInfo(
      {String? firstName,
      String? lastName,
      String? phoneNumber,
      String? email,
      String? profilePicture,
      String? role}) async {
    Map<String, dynamic> val = {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email,
      "role": role
    };

    FormData formData;
    MultipartFile userPicture;
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> noMediaReq = {}..addAll(val);

    if (profilePicture!.isNotEmpty) {
      userPicture = await MultipartFile.fromFile(
        profilePicture,
        filename: '$id/$profilePicture',
      );

      formData = FormData.fromMap(val..addAll({"profilePicture": userPicture}));

      var responsebody = await server.post(
          ApiRoutes.updateUserDetails, await headerWithToken(), noMediaReq,
          multimediaRequest: formData);
      ApiResponse response = ApiResponse.fromJson(responsebody);
      return response;
    } else {
      var responsebody = await server.post(
        ApiRoutes.updateUserDetails,
        await headerWithToken(),
        jsonEncode(val),
      );
      ApiResponse response = ApiResponse.fromJson(responsebody);
      return response;
    }
  }

  @override
  Future<AllUserModel> getAllUser() async {
    var responsebody =
        await server.get(ApiRoutes.getAllUser, await headerWithToken());
    AllUserModel response = allUserModelFromJson(responsebody);
    return response;
  }

  @override
  Future<UserDetailsModel> getUserDetails({String? userId}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getUserDetails}/$userId/details", await headerWithToken());
    UserDetailsModel response = userDetailsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<UserRoles> getUserRoles() async {
    var responsebody =
        await server.get(ApiRoutes.getRoles, await headerWithToken());
    UserRoles response = userRolesFromJson(responsebody);
    return response;
  }
}
