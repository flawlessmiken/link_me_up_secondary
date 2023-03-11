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
}
