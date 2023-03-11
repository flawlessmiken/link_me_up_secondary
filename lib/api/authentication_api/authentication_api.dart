import 'package:link_me_up_secondary/api/core/models/api_response.dart';
import 'package:link_me_up_secondary/api/core/models/complete_profile_response.dart';
import 'package:link_me_up_secondary/api/core/models/create_admin_profile_response.dart';
import 'package:link_me_up_secondary/api/core/models/create_business_profile_response.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/settings/change_password_screen.dart';

import '../core/models/forgot_password_validate_OTP.dart';
import '../core/models/login_model.dart';

abstract class AUthenticationApi {
  Future<CreateAdminProfileResponse> createAdminProfile({
    String firstName,
    String lastName,
    String phoneNumber,
    String email,
    String password,
    String profilePicture,
  });

  Future<ApiResponse> createPin({
    String userId,
    String pin,
    String confirmPin,
  });

  Future<ApiResponse> validateOTP({
    String email,
    String otpCode,
  });

  Future<ApiResponse> resendOTP({
    String email,
  });

  Future<CreateBusinessProfileResponse> createBusinessProfile({
    String category,
    String name,
    String postalCode,
    String address,
    String email,
    String phoneNumber,
    String website,
  });

  Future<CompleteProfileResponse> addPictureAndNameTag({
    String accountId,
    String nameTag,
    String adminId,
    String companyImage,
  });

  Future<LoginModel> login({
    String email,
    String password,
  });
  Future<ApiResponse> forgotPassword({
    String email,
  });
  Future<ValidateForgotPasswordOtp> forgotPasswordValidateOTP({
    String email,
    String OTPcode,
  });

  Future<ApiResponse> forgotPasswordValidatePin({
    String userId,
    String pin,
  });

  Future<ApiResponse> changePassword(
      {String userId, String newPassword, String confirmNewPassword});
}
