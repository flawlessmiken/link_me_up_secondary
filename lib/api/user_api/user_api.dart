import 'package:link_me_up_secondary/api/core/models/api_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';

abstract class UserApi {
  Future<UserInfoResponse> fetchUserInfo();
}
