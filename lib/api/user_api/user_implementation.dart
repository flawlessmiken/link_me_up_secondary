import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:link_me_up_secondary/api/core/models/all_product_model.dart';
import 'package:link_me_up_secondary/api/core/models/all_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/api_response.dart';
import 'package:link_me_up_secondary/api/core/models/blocked_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/cart_item_model.dart';
import 'package:link_me_up_secondary/api/core/models/clock_in_model.dart';
import 'package:link_me_up_secondary/api/core/models/contact_model.dart';
import 'package:link_me_up_secondary/api/core/models/contact_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/directory_model.dart';
import 'package:link_me_up_secondary/api/core/models/directory_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/enrolmentRequestModel.dart';
import 'package:link_me_up_secondary/api/core/models/history_model.dart';
import 'package:link_me_up_secondary/api/core/models/notificationDetails.dart';
import 'package:link_me_up_secondary/api/core/models/notification_model.dart';
import 'package:link_me_up_secondary/api/core/models/product_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/secondary_account_info.dart';
import 'package:link_me_up_secondary/api/core/models/user_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';
import 'package:link_me_up_secondary/api/user_api/user_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../locator.dart';
import '../api_utils/api_helper.dart';
import '../api_utils/api_routes.dart';
import '../core/models/history_details_model.dart';
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
      String? role,
      String? userId}) async {
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
    log("${userId}");

    if (profilePicture!.isNotEmpty) {
      userPicture = await MultipartFile.fromFile(
        profilePicture,
        filename: '$id/$profilePicture',
      );

      formData = FormData.fromMap(val..addAll({"profilePicture": userPicture}));

      var responsebody = await server.put(
          "${ApiRoutes.updateUserDetails}/$userId",
          await headerWithToken(),
          noMediaReq,
          multimediaRequest: formData);
      ApiResponse response = ApiResponse.fromJson(responsebody);
      return response;
    } else {
      var responsebody = await server.put(
        "${ApiRoutes.updateUserDetails}/$userId",
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

  @override
  Future<NotificationModel> getNotification() async {
    var responsebody =
        await server.get(ApiRoutes.getNotification, await headerWithToken());
    NotificationModel response = notificationModelFromJson(responsebody);
    return response;
  }

  @override
  Future<NotificationDetailsModel> getNotificationDetails(
      {String? notificationID}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getNotificationDetails}/$notificationID/details",
        await headerWithToken());
    NotificationDetailsModel response =
        notificationDetailsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> toggleNotificationView() async {
    var responsebody = await server.patch(
        ApiRoutes.toggleNotificationView, await headerWithToken());
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<EnrolmentRequestModel> enrolmentDetails({String? dataId}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getEnrollmentDetails}/$dataId", await headerWithToken());
    EnrolmentRequestModel response =
        enrolmentRequestModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> acceptEnrolment({String? dataId}) async {
    var responsebody = await server.put(
        "${ApiRoutes.acceptEnrolment}/$dataId/accept",
        await headerWithToken(),
        "");
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> declineEnrolment({String? dataId}) async {
    var responsebody = await server.put(
        "${ApiRoutes.acceptEnrolment}/$dataId/decline",
        await headerWithToken(),
        "");
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<SecondaryAccountInfo> fetchSecondaryAccount() async {
    var responsebody = await server.get(
      "${ApiRoutes.getSecondaryAccount}",
      await headerWithToken(),
    );
    SecondaryAccountInfo response = secondaryAccountInfoFromJson(responsebody);
    return response;
  }

  @override
  Future<DirectoryModel> fetchDirectory() async {
    var responsebody = await server.get(
      "${ApiRoutes.getDirectory}",
      await headerWithToken(),
    );
    DirectoryModel response = directoryModelFromJson(responsebody);
    return response;
  }

  @override
  Future<DirectoryDetailsModel> fetchDirectoryDetails({String? id}) async {
    var responsebody = await server.get(
      "${ApiRoutes.getDirectoryDetails}/$id",
      await headerWithToken(),
    );
    DirectoryDetailsModel response =
        directoryDetailsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> blockAUser({String? id}) async {
    var responsebody = await server.put(
        "${ApiRoutes.blockAUser}/$id/block", await headerWithToken(), "");
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<BlockedUserModel> getAllBlockedUsers() async {
    var responsebody = await server.get(
      ApiRoutes.getAllBlockedUsers,
      await headerWithToken(),
    );
    BlockedUserModel response = blockedUserModelFromJson(responsebody);

    return response;
  }

  @override
  Future<ApiResponse> unBlockAUser({String? id}) async {
    var responsebody = await server.put(
        "${ApiRoutes.unblockAUser}/$id/unblock", await headerWithToken(), "");
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> validatePin({String? pin}) async {
    Map val = {"pin": pin};
    var responsebody = await server.post(
        ApiRoutes.validatePin, await headerWithToken(), jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<AllClockInModel> getClockIn() async {
    var responsebody =
        await server.get(ApiRoutes.getClockInForToday, await headerWithToken());
    AllClockInModel response = allClockInModelFromJson(responsebody);
    return response;
  }

  @override
  Future<HistoryModel> getGuestHistory({String? date}) async {
    print(date);
    var responsebody = await server.get(
        "${ApiRoutes.getGuestHistory}?date=$date", await headerWithToken());
    HistoryModel response = historyModelsFromJson(responsebody);
    return response;
  }

  @override
  Future<HistoryDetailsModel> getGuestHistoryDetails({String? id}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getGuestHistoryDetails}/$id", await headerWithToken());
    HistoryDetailsModel response = historyDetailsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<HistoryDetailsModel> getUserHistoryDetails({String? id}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getUserHistoryDetails}/$id", await headerWithToken());
    HistoryDetailsModel response = historyDetailsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<HistoryModel> getResidentHistory({String? date}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getResidentHistory}?date=$date", await headerWithToken());
    HistoryModel response = historyModelsFromJson(responsebody);
    return response;
  }

  @override
  Future<HistoryModel> getStaffHistory({String? date}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getStaffHistory}?date=$date", await headerWithToken());
    HistoryModel response = historyModelsFromJson(responsebody);
    return response;
  }

  @override
  Future<HistoryModel> getStudentHistory({String? date}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getStudentHistory}?date=$date", await headerWithToken());
    HistoryModel response = historyModelsFromJson(responsebody);
    return response;
  }

  @override
  Future<ContactModel> getAllContact() async {
    var responsebody =
        await server.get(ApiRoutes.getAllContact, await headerWithToken());
    ContactModel response = contactModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ContactDetailsModel> getContactDetails({String? id}) async {
    var responsebody = await server.get(
        "${ApiRoutes.getContactDetails}/$id/details", await headerWithToken());
    ContactDetailsModel response = contactDetailsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> addItemToCart({String? id, String? quantity}) async {
    Map val = {"id": id, "quantity": quantity};
    var responsebody = await server.post(
        ApiRoutes.addItemToCart, await headerWithToken(), jsonEncode(val));
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }

  @override
  Future<AllProductModel> getAllProduct() async {
    var responsebody =
        await server.get(ApiRoutes.getAllOrderProduct, await headerWithToken());
    AllProductModel response = allProductModelFromJson(responsebody);
    return response;
  }

  @override
  Future<CartItemModel> getItemInCart() async {
    var responsebody =
        await server.get(ApiRoutes.getCartItem, await headerWithToken());
    CartItemModel response = cartItemModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ProductDetailsModel> getProductDetails({String? id}) async {
    var responsebody =
        await server.get("${ApiRoutes.getProductDetails}/$id", await headerWithToken());
    ProductDetailsModel response = productDetailsModelFromJson(responsebody);
    return response;
  }

  @override
  Future<ApiResponse> processPayment() {
    // TODO: implement processPayment
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse> removeItemFromCart({String? id}) async {
    var responsebody = await server.delete(
        "${ApiRoutes.removeItemFromCart}/$id", await headerWithToken());
    ApiResponse response = ApiResponse.fromJson(responsebody);
    return response;
  }
}
