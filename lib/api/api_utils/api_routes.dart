class ApiRoutes {
  //base route
  static const String base = 'https://thoughtful-lamb-bracelet.cyclic.app';

  //AUthentication
  static const String login = '$base/api/secondary/user/login';
  static const String createAdminDetails = '$base/api/secondary/user/create';
  static const String createPin = '$base/api/secondary/user/create-pin';
  static const String resendOTP = '$base/api/secondary/user/resend-otp';
  static const String validOTP = '$base/api/secondary/user/validate-otp';
  static const String createBusinessProfile =
      '$base/api/secondary/create-account';
  static const String addPictureAndNameTag =
      '$base/api/secondary/account/add-picture';
  static const String fetchUserInfo = '$base/api/secondary/user/info';
  static const String forgotPassword =
      '$base/api/secondary/user/forgot-password/send-otp';
  static const String forgotPasswordValidateOTP =
      '$base/api/secondary/user/forgot-password/validate-otp';
  static const String forgotPasswordValidatePIN =
      '$base/api/secondary/user/forgot-password/validate-pin';

  static const String forgotPasswordChangePassword =
      '$base/api/secondary/user/forgot-password/change-password';

  //users
  static const String addNewUser = '$base/api/secondary/user/new';
  static const String getRoles = '$base/api/secondary/users/roles';
  static const String getAllUser = '$base/api/secondary/users/all';
  static const String getUserDetails = '$base/api/secondary/user/';
  static const String updateUserDetails = '$base/api/secondary/user/';

  //


  


}
