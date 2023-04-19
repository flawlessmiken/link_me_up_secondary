import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/models/all_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/blocked_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/clock_in_model.dart';
import 'package:link_me_up_secondary/api/core/models/contact_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/contact_model.dart';
import 'package:link_me_up_secondary/api/core/models/directory_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/directory_model.dart';
import 'package:link_me_up_secondary/api/core/models/enrolmentRequestModel.dart';
import 'package:link_me_up_secondary/api/core/models/history_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/history_model.dart';
import 'package:link_me_up_secondary/api/core/models/notificationDetails.dart';
import 'package:link_me_up_secondary/api/core/models/notification_model.dart';
import 'package:link_me_up_secondary/api/core/models/secondary_account_info.dart';
import 'package:link_me_up_secondary/api/core/models/user_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';
import 'package:link_me_up_secondary/api/user_api/user_api.dart';
import 'package:link_me_up_secondary/services/local_storage.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/base_view_model.dart';
import 'package:link_me_up_secondary/ui/mixin/validators.dart';

import '../../../locator.dart';
import '../../../ui/mixin/responsive_state/view_state.dart';
import '../../api_utils/network_exception.dart';
import '../models/all_product_model.dart';
import '../models/cart_item_model.dart';
import '../models/product_details_model.dart';
import '../models/successfully_added_user_model.dart';

class UserRepository extends BaseNotifier with Validators {
  var userApi = locator<UserApi>();

  bool hasNewNotification = false;
  String notificationStatus = "";

  UserInfoResponse userInfoResponse = UserInfoResponse();
  SecondaryAccountInfo secondaryAccountInfo = SecondaryAccountInfo();

  AllUserModel allUserModel = AllUserModel();
  UserDetailsModel userDetailsModel = UserDetailsModel();
  UserRoles userRoles = UserRoles();
  NotificationModel notificationModel = NotificationModel();
  BlockedUserModel blockedUserModel = BlockedUserModel();
  ContactModel contactModel = ContactModel();
  ContactDetailsModel contactDetailsModel = ContactDetailsModel();
  AllClockInModel allClockInModel = AllClockInModel();
  HistoryModel guestHistory = HistoryModel();
  HistoryModel staffHistory = HistoryModel();
  HistoryModel residentHistory = HistoryModel();
  HistoryModel studentHistory = HistoryModel();

  ProductDetailsModel productDetailsModel = ProductDetailsModel();
  CartItemModel cartItemModel = CartItemModel();
  AllProductModel allProductModel = AllProductModel();

  HistoryDetailsModel guestHistoryDetails = HistoryDetailsModel();
  HistoryDetailsModel userHistoryDetails = HistoryDetailsModel();

  List<clockIn> clock_in_list = [];
  List<clockIn> clock_out_list = [];

  sortClockInList() {
    clock_in_list.clear();
    clock_out_list.clear();
    for (var i = 0; i < allClockInModel.data!.length; i++) {
      if (allClockInModel.data?.elementAt(i).entryType == "in") {
        clock_in_list.add(allClockInModel.data!.elementAt(i));
      } else {
        clock_out_list.add(allClockInModel.data!.elementAt(i));
      }
    }
  }

  NotificationDetailsModel notificationDetailsModel =
      NotificationDetailsModel();
  EnrolmentRequestModel enrolmentRequestModel = EnrolmentRequestModel();

  DirectoryModel directoryModel = DirectoryModel();
  DirectoryDetailsModel directoryDetailsModel = DirectoryDetailsModel();

  SuccessfullAddedUserModel successfullAddedUserModel =
      SuccessfullAddedUserModel();

  Future<bool> fetchUserInfo() async {
    setState(ViewState.Busy);
    try {
      userInfoResponse = await userApi.fetchUserInfo();

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

  Future<bool> addNewUser(String firstName, String lastName, String phoneNumber,
      String email, String password, String profilePicture, String role) async {
    setState(ViewState.Busy);
    try {
      successfullAddedUserModel = await userApi.addNewUser(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          password: password,
          profilePicture: profilePicture,
          role: role);

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

  Future<bool> editUserProfile(
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String profilePicture,
    String role,
    String userId,
  ) async {
    setState(ViewState.Busy);
    try {
      await userApi.editUserInfo(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
          profilePicture: profilePicture,
          role: role,
          userId: userId);
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

  Future<bool> fetchAllUser() async {
    setState(ViewState.Busy);
    try {
      allUserModel = await userApi.getAllUser();

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

  Future<bool> getUserDetails(String userId) async {
    setState(ViewState.Busy);
    try {
      userDetailsModel = await userApi.getUserDetails(userId: userId);
     await localStorage.setString("userId", userDetailsModel.data!.id!);
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

  Future<bool> getUserRoles() async {
    setState(ViewState.Busy);
    try {
      userRoles = await userApi.getUserRoles();
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

  Future<bool> fetchNotification() async {
    setState(ViewState.Busy);
    try {
      notificationModel = await userApi.getNotification();
      checkNotification();
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

  Future<bool> fetchNotificationDetails(String notificationId) async {
    setState(ViewState.Busy);
    try {
      notificationDetailsModel =
          await userApi.getNotificationDetails(notificationID: notificationId);
      checkNotificationStatus();

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

  checkNotification() {
    for (var item in notificationModel.data!) {
      if (!item.read!) {
        hasNewNotification = true;
        notifyListeners();
        // break;
      } else {
        hasNewNotification = false;
        notifyListeners();

        // break;
      }
    }
  }

  checkNotificationStatus() {
    if (notificationDetailsModel.data!.body!.contains("accepted")) {
      notificationStatus = "accepted";
    } else if (notificationDetailsModel.data!.body!.contains("declined")) {
      notificationStatus = "declined";
    } else {
      notificationStatus = "pending";
    }
    notifyListeners();
    log("${notificationDetailsModel.data!.body} $notificationStatus");
  }

  Future<bool> toggleNotificationView() async {
    setState(ViewState.Busy);
    try {
      await userApi.toggleNotificationView();
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

  Future<bool> getEnrolmentRequestDetails(String id) async {
    setState(ViewState.Busy);
    try {
      enrolmentRequestModel = await userApi.enrolmentDetails(dataId: id);
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

  Future<bool> acceptEnrolmentRequest(String id) async {
    setState(ViewState.Busy);
    try {
      await userApi.acceptEnrolment(dataId: id);
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

  Future<bool> declineEnrolment(String id) async {
    setState(ViewState.Busy);
    try {
      await userApi.declineEnrolment(dataId: id);
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

  Future<bool> getSecondaryAccountInfo() async {
    setState(ViewState.Busy);
    try {
      secondaryAccountInfo = await userApi.fetchSecondaryAccount();
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

  Future<bool> getDirectory() async {
    setState(ViewState.Busy);
    try {
      directoryModel = await userApi.fetchDirectory();
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

  Future<bool> getDirectoryDetails(String id) async {
    setState(ViewState.Busy);
    try {
      directoryDetailsModel = await userApi.fetchDirectoryDetails(id: id);
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

  Future<bool> blockAUser(String id) async {
    setState(ViewState.Busy);
    try {
      await userApi.blockAUser(id: id);
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

  Future<bool> unblockAUser(String id) async {
    setState(ViewState.Busy);
    try {
      await userApi.unBlockAUser(id: id);
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

  Future<bool> getBlockedUsers() async {
    setState(ViewState.Busy);
    try {
      blockedUserModel = await userApi.getAllBlockedUsers();
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

  Future<bool> validateUserPin(String pin) async {
    setState(ViewState.Busy);
    try {
      await userApi.validatePin(pin: pin);
      setState(ViewState.Idle);
      return true;
    } on NetworkException {
      displayError(
          error: 'No Internet!',
          message: 'Please check your internet Connection');
    } catch (e) {
      displayError(error: 'Error!', message: '$e');
      print(e);
    }
    setState(ViewState.Idle);
    return false;
  }

  Future<bool> getClockIn() async {
    setState(ViewState.Busy);
    try {
      allClockInModel = await userApi.getClockIn();
      sortClockInList();
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

  Future<bool> getGuestHistory(String date) async {
    setState(ViewState.Busy);
    try {
      guestHistory = await userApi.getGuestHistory(date: date);
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

  Future<bool> getStudentHistory(String date) async {
    setState(ViewState.Busy);
    try {
      studentHistory = await userApi.getStudentHistory(date: date);
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

  Future<bool> getResidentHistory(String date) async {
    setState(ViewState.Busy);
    try {
      residentHistory = await userApi.getResidentHistory(date: date);
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

  Future<bool> getStaffHistory(String date) async {
    setState(ViewState.Busy);
    try {
      staffHistory = await userApi.getStaffHistory(date: date);
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

  Future<bool> getUserHistoryDetails(String id) async {
    setState(ViewState.Busy);
    try {
      guestHistoryDetails = await userApi.getUserHistoryDetails(id: id);
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

  Future<bool> getGuestHistoryDetails(String id) async {
    setState(ViewState.Busy);
    try {
      guestHistoryDetails = await userApi.getGuestHistoryDetails(id: id);
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

  Future<bool> getAllContact() async {
    setState(ViewState.Busy);
    try {
      contactModel = await userApi.getAllContact();
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

  Future<bool> getContactDetails(String id) async {
    setState(ViewState.Busy);
    try {
      contactDetailsModel = await userApi.getContactDetails(id: id);
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

  Future<bool> addItemCart(String id, String quantity) async {
    setState(ViewState.Busy);
    try {
      await userApi.addItemToCart(id: id, quantity: quantity);
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

  Future<bool> getCartItem() async {
    setState(ViewState.Busy);
    try {
      cartItemModel = await userApi.getItemInCart();
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

  Future<bool> getAllProduct() async {
    setState(ViewState.Busy);
    try {
      allProductModel = await userApi.getAllProduct();
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

  Future<bool> getProductDetails(String id) async {
    setState(ViewState.Busy);
    try {
      productDetailsModel = await userApi.getProductDetails(id: id);
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

  Future<bool> removeItemFromCart() async {
    setState(ViewState.Busy);
    try {
      await userApi.removeItemFromCart();
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
