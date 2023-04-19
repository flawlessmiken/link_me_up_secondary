import 'package:link_me_up_secondary/api/core/models/all_product_model.dart';
import 'package:link_me_up_secondary/api/core/models/all_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/api_response.dart';
import 'package:link_me_up_secondary/api/core/models/cart_item_model.dart';
import 'package:link_me_up_secondary/api/core/models/clock_in_model.dart';
import 'package:link_me_up_secondary/api/core/models/contact_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/contact_model.dart';
import 'package:link_me_up_secondary/api/core/models/directory_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/directory_model.dart';
import 'package:link_me_up_secondary/api/core/models/enrolmentRequestModel.dart';
import 'package:link_me_up_secondary/api/core/models/history_model.dart';
import 'package:link_me_up_secondary/api/core/models/notificationDetails.dart';
import 'package:link_me_up_secondary/api/core/models/notification_model.dart';
import 'package:link_me_up_secondary/api/core/models/product_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/secondary_account_info.dart';
import 'package:link_me_up_secondary/api/core/models/successfully_added_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';

import '../core/models/blocked_user_model.dart';
import '../core/models/history_details_model.dart';

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

  Future<ApiResponse> editUserInfo({
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String profilePicture,
    String role,
    String userId,
  });
  Future<UserDetailsModel> getUserDetails({
    String userId,
  });

  Future<UserRoles> getUserRoles();
  Future<NotificationModel> getNotification();
  Future<ApiResponse> toggleNotificationView();

  Future<NotificationDetailsModel> getNotificationDetails(
      {String notificationID});

  Future<EnrolmentRequestModel> enrolmentDetails({String dataId});

  Future<ApiResponse> acceptEnrolment({String dataId});

  Future<ApiResponse> declineEnrolment({String dataId});

  Future<SecondaryAccountInfo> fetchSecondaryAccount();
  Future<DirectoryModel> fetchDirectory();
  Future<DirectoryDetailsModel> fetchDirectoryDetails({String id});
  Future<ApiResponse> blockAUser({String id});
  Future<ApiResponse> unBlockAUser({String id});
  Future<BlockedUserModel> getAllBlockedUsers();

  Future<ApiResponse> validatePin({String pin});

  Future<ContactModel> getAllContact();
  Future<ContactDetailsModel> getContactDetails({String id});

  Future<AllClockInModel> getClockIn();
  Future<HistoryModel> getGuestHistory({String date});
  Future<HistoryModel> getStudentHistory({String date});
  Future<HistoryModel> getStaffHistory({String date});
  Future<HistoryModel> getResidentHistory({String date});

  Future<HistoryDetailsModel> getGuestHistoryDetails({String id});
  Future<HistoryDetailsModel> getUserHistoryDetails({String id});


  
  Future<AllProductModel> getAllProduct();
  Future<ProductDetailsModel> getProductDetails({String id});
  Future<ApiResponse> processPayment();
  Future<ApiResponse> addItemToCart({String id, String quantity});
  Future<ApiResponse> removeItemFromCart({String id,});
  Future<CartItemModel> getItemInCart();








}
