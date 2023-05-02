class ApiRoutes {
  //base route
  static const String base = 'https://thoughtful-lamb-bracelet.cyclic.app';

  //AUthentication
  static const String login = '$base/api/secondary/user/login';
  static const String createAdminDetails = '$base/api/secondary/user/create';
  static const String createPin = '$base/api/secondary/user/create-pin';
  static const String resendOTP = '$base/api/secondary/user/resend-otp';
  static const String validOTP = '$base/api/secondary/user/validate-otp';
  static const String createBusinessProfile ='$base/api/secondary/create-account';

 
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
  static const String getUserDetails = '$base/api/secondary/user';
  static const String updateUserDetails = '$base/api/secondary/user';
  static const String getSecondaryAccount = '$base/api/secondary/account-info';

  //notifications
  static const String getNotification = '$base/api/secondary/notification';
  static const String toggleNotificationView =
      '$base/api/secondary/notification/view';
  static const String getNotificationDetails =
      '$base/api/secondary/notification';

  // enrollment
  static const String getEnrollmentDetails =
      '$base/api/secondary/enrollment/details';
  static const String acceptEnrolment = '$base/api/secondary/enrollment';
  static const String declineEnrolment = '$base/api/secondary/enrollment';

  // directory
  static const String getDirectory = '$base/api/secondary/directory/all';
  static const String getDirectoryDetails =
      '$base/api/secondary/directory/user';

  //block
  static const String blockAUser = '$base/api/secondary/blocked';
  static const String getAllBlockedUsers = '$base/api/secondary/blocked/all';
  static const String unblockAUser = '$base/api/secondary/blocked';

  //2FA
  static const String validatePin = '$base/api/secondary/user/validate-pin';

//contact
  static const String getAllContact = '$base/api/secondary/contact/all';
  static const String getContactDetails = '$base/api/secondary/contact';

  //clockIn
  static const String getClockInForToday = '$base/api/secondary/clocks/today';

  //History
  static const String getStaffHistory = '$base/api/secondary/history/staff';
  static const String getStudentHistory = '$base/api/secondary/history/student';
  static const String getResidentHistory =
      '$base/api/secondary/history/resident';
  static const String getGuestHistory = '$base/api/secondary/history/guests';
  static const String getGuestHistoryDetails =
      '$base/api/secondary/history/guest';
  static const String getUserHistoryDetails =
      '$base/api/secondary/history/user';

  //cart
  static const String addItemToCart = '$base/api/secondary/cart/items';
  static const String removeItemFromCart = '$base/api/secondary/cart/items';
  static const String getCartItem = '$base/api/secondary/cart';

  //order
  static const String getAllOrderProduct =
      '$base/api/secondary/orders/products';
  static const String getProductDetails = '$base/api/secondary/orders/product';
  static const String processPayment = '$base/api/secondary/payment/charge';

  // check in
  static const String entryCheckin ='$base/api/secondary/entry/checkin';
  static const String entryCheckout ='$base/api/secondary/entry/checkout';
  static const String entryDismissed ='$base/api/secondary/entry/dismiss';
  static const String entryDoorBell ='$base/api/secondary/entry/doorbell';
  static const String getAllEntries ='$base/api/secondary/entry/today';


  //entries
  static const String guestEntry ='$base/api/secondary/entrylist';
  static const String staffEntry ='$base/api/secondary/entrylist';
  static const String studentEntry ='$base/api/secondary/entrylist';
  static const String residentEntry ='$base/api/secondary/entrylist';

  


  // check in
  static const String getWalletBalance ='$base/api/secondary/wallet/balance';
  static const String getWalletTransaction ='$base/api/secondary/wallet/transactions';



}
