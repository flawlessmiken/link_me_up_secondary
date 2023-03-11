import 'dart:developer';

import 'package:link_me_up_secondary/api/core/models/api_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/user_api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';
import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';

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
}
