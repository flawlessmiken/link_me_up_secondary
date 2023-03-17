import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/models/all_user_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_details_model.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';
import 'package:link_me_up_secondary/api/user_api/user_api.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/base_view_model.dart';
import 'package:link_me_up_secondary/ui/mixin/validators.dart';

import '../../../locator.dart';
import '../../../ui/mixin/responsive_state/view_state.dart';
import '../../api_utils/network_exception.dart';
import '../models/successfully_added_user_model.dart';

class UserRepository extends BaseNotifier with Validators {
  var userApi = locator<UserApi>();
  UserInfoResponse userInfoResponse = UserInfoResponse();
  AllUserModel allUserModel = AllUserModel();
  UserDetailsModel userDetailsModel = UserDetailsModel();
  UserRoles userRoles = UserRoles();
  SuccessfullAddedUserModel successfullAddedUserModel = SuccessfullAddedUserModel();


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
    successfullAddedUserModel =   await userApi.addNewUser(
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
      String role) async {
    setState(ViewState.Busy);
    try {
      await userApi.editUserInfo(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          email: email,
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
