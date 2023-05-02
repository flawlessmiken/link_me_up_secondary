import 'package:link_me_up_secondary/api/models/all_product_model.dart';
import 'package:link_me_up_secondary/api/models/all_user_model.dart';
import 'package:link_me_up_secondary/api/models/api_response.dart';
import 'package:link_me_up_secondary/api/models/cart_model.dart';
import 'package:link_me_up_secondary/api/models/clock_in_model.dart';
import 'package:link_me_up_secondary/api/models/contact_details_model.dart';
import 'package:link_me_up_secondary/api/models/contact_model.dart';
import 'package:link_me_up_secondary/api/models/directory_details_model.dart';
import 'package:link_me_up_secondary/api/models/directory_model.dart';
import 'package:link_me_up_secondary/api/models/enrolmentRequestModel.dart';
import 'package:link_me_up_secondary/api/models/entry_list_model.dart';
import 'package:link_me_up_secondary/api/models/history_model.dart';
import 'package:link_me_up_secondary/api/models/notificationDetails.dart';
import 'package:link_me_up_secondary/api/models/notification_model.dart';
import 'package:link_me_up_secondary/api/models/product_details_model.dart';
import 'package:link_me_up_secondary/api/models/secondary_account_info.dart';
import 'package:link_me_up_secondary/api/models/successfully_added_user_model.dart';
import 'package:link_me_up_secondary/api/models/user_details_model.dart';
import 'package:link_me_up_secondary/api/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/models/user_roles_model.dart';
import 'package:link_me_up_secondary/api/models/wallet_transaction_model.dart';

import '../models/blocked_user_model.dart';
import '../models/history_details_model.dart';

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
  Future<ApiResponse> addItemToCart({String id, int quantity,  List users});
  Future<ApiResponse> removeItemFromCart({String id,});
  Future<CartModel> getItemInCart();

  Future<ApiResponse> getWalletBalance();
  Future<WalletTransactionModel> getWalletTransaction();


  Future<EntryListModel> guestEntry({String id, String date});
  Future<EntryListModel> staffEntry({String id, String date});
  Future<EntryListModel> studentEntry({String id, String date});
  Future<EntryListModel> residentEntry({String id, String date});










}
