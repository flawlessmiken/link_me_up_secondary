import 'package:link_me_up_secondary/api/core/models/all_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/api_response.dart';
import 'package:link_me_up_secondary/api/core/models/successfully_added_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';

abstract class UserApi {
  Future<UserInfoResponse> fetchUserInfo();
  Future<AllUserModel> getAllUser();
  Future<SuccessfullAddedUserModel> addNewUser(
      {String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String password,
      String profilePicture,
      String role});

  Future<ApiResponse> editUserInfo(
      {String firstName,
      String lastName,
      String phoneNumber,
      String email,
      String profilePicture,
      String role});
  Future<UserDetailsModel> getUserDetails({
    String userId,
  });

  Future<UserRoles> getUserRoles();
}
