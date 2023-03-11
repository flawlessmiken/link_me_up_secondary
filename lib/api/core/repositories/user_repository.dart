import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/models/user_info_response.dart';
import 'package:link_me_up_secondary/api/user_api/user_api.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/base_view_model.dart';
import 'package:link_me_up_secondary/ui/mixin/validators.dart';

import '../../../locator.dart';
import '../../../ui/mixin/responsive_state/view_state.dart';
import '../../api_utils/network_exception.dart';

class UserRepository extends BaseNotifier with Validators {
  var userApi = locator<UserApi>();
  UserInfoResponse userInfoResponse = UserInfoResponse();

  Future<bool> fetchUserInfo() async {
    setState(ViewState.Busy);
    try {
    userInfoResponse = await  userApi.fetchUserInfo();

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
