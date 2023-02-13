import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/screen/start_screen/splashScreen.dart';
import '../ui/screen/start_screen/start_screen.dart';

class RouteNames {
  ///Route names used through out the app will be specified as static constants here in this format
  /// static const String splashScreen = '/splashScreen';

  static const String startScreen = 'startScreen';
  static const String phoneNumberScreen = 'phoneNumberScreen';
  static const String verifyScreen = 'verifyScreen';
  static const String splashScreen = 'splashScreen';
  static const String homePage = 'homePage';
  static const String personalDetails = 'personalDetails';
  static const String identityPage = 'identityPage';
  static const String profilepictureandnametag = 'profilepictureandnametag';
  static const String completedRegistration = 'completeRegistration';
  static const String contactList = 'contactList';
  static const String contactPersonalInformation = 'contactPersonalInformation';
  static const String userProfileScreen = 'userProfileScreen';
  static const String workScreen = 'workScreen';
  static const String cameraScanScreen = 'cameraScanScreen';
  static const String personalBusinessQrScreen = 'personalBusinessQrScreen';
  static const String workForm = 'workFOrm';
  static const String workProfile = 'workProfile';
  static const String student = 'student';
  static const String tertiaryStudentProfile = 'tertiaryStudentProfile';
  static const String secondaryStudentProfile = 'secondaryStudentProfile';
  static const String primaryStudentProfile = 'primaryStudentProfile';
  static const String contactScreen = 'contactScreen';
  static const String homeProfileScreen = 'homeProfileScreen';
  static const String settingScreen = 'settingScreen';
  static const String changePhoneNumber = 'changePhoneNumber';
  static const String privacyScreen = 'privacyScreen';
  static const String deleteScreen = 'deleteScreen';
  static const String deleteMyAccount = 'deleteMyAccount';
  static const String deleteHome = 'deleteHome';
  static const String deleteWork = 'deleteWork';
  static const String deleteStudent = 'deleteStudent';
  static const String scanOption = 'scanOption';
  static const String approvedResultScreen = 'approvedResultScreen';
  static const String appointmentDetails = 'appointmentDetails';
  static const String notification_screen = 'notification';
  static const String contactRequestScreen = 'contactRequestScreen';
  static const String appointmentScreen = 'appointmentScreen';
  static const String rescheduleMeeting = 'rescheduleMeeting';
  static const String attendeeScreen = 'attendeeScreen';
  static const String userPin = 'userPIn';
  static const String newMeetingScreen = 'newMeetingScreen';
  static const String addAttendeeScreen = 'addAttendeeScreen';
  static const String calendarScreen = 'calendarScreen';
  static const String timeZoneScreen = 'timeZoneScreen';
  static const String sharePersonalContact = 'sharePersonalContact';
  static const String shareBusinessContact = 'shareBusinessContact';
  static const String shareBusinessAndPersonal = 'shareBusinessAndPersonal';
  static const String viewHomeProfile = 'viewHomeProfile';
  static const String verifyPhoneNumber = 'verifyPhoneNumber';
  static const String editUserProfile = 'editUserProfile';
  static const String estateProfile = 'estateProfile';
  static const String estateDetails = 'estateDetails';
  static const String quickInvite = 'quickInvite';

  static Map<String, Widget Function(BuildContext)> routes = {
    ///Named routes to be added here in this format
    RouteNames.splashScreen: (context) => SplashScreen(),
    // startScreen: (context) => StartScreen(),
    // phoneNumberScreen: (context) => PhoneNumberScreen(),
    // verifyScreen: (context) => VerificationScreen(),
    // splashScreen: (context) => SplashScreen(),
    // homePage: (context) => HomeScreen(),
    // personalDetails: (context) => const PersonalDetails(),
    // identityPage: (context) => Identity(),
    // profilepictureandnametag: (context) => const Profilepictureandnametag(),
    // completedRegistration: (context) => const CompleteRegistration(),
    // contactPersonalInformation: (context) => const ContactPersonalInformation(),
    // contactList: (context) => const ContactlistScreen(),
    // cameraScanScreen: (context) => CameraScanScreen(),
    // personalBusinessQrScreen: (context) => PersonalBusinessQRScreen(),
    // userProfileScreen: (context) => const UserProfileScreen(),
    // workScreen: (context) => const WorkScreen(),
    // workForm: (context) => const WorkForm(),
    // workProfile: (context) => const WorkProfile(),
    // student: (context) => const Student(),
    // tertiaryStudentProfile: (context) => const TertiaryStudentProfile(),
    // secondaryStudentProfile: (context) => const SecondaryProfile(),
    // primaryStudentProfile: (context) => const PrimaryProfile(),
    // contactScreen: (context) => const ContactScreen(),
    // homeProfileScreen: (context) => const HomeProfile(),
    // settingScreen: (context) => const Settings(),
    // changePhoneNumber: (context) => const ChangePhoneNUmber(),
    // privacyScreen: (context) => const Privacy(),
    // deleteScreen: (context) => const Delete(),
    // deleteMyAccount: (context) => const DeleteMyAccount(),
    // deleteHome: (context) => const DeleteHome(),
    // deleteWork: (context) => const DeleteWorkProfile(),
    // deleteStudent: (context) => const DeleteStudentProfile(),
    // scanOption: (context) => const ScanOption(),
    // approvedResultScreen: (context) => const ApprovedResultScreen(),
    // appointmentDetails: (context) => const AppointmentDetails(),
    // notification_screen: (context) => const Notification_screen(),
    // contactRequestScreen: (context) => const ContactRequestScreen(),
    // appointmentScreen: (context) => const AppointmentScreen(),
    // rescheduleMeeting: (context) => const RescheduleMeeting(),
    // attendeeScreen: (context) => const Attendee_screen(),
    // userPin: (context) => const UserPin(),
    // appointmentDetails: (context) => const AppointmentScreen(),
    // rescheduleMeeting: (context) => const RescheduleMeeting(),
    // attendeeScreen: (context) => const Attendee_screen(),
    // newMeetingScreen: (context) => NewMeetingScreen(),
    // addAttendeeScreen: (context) => AddAtendeesScreen(),
    // // calendarScreen: (context) => const CalendarScreen(),
    // timeZoneScreen: (context) => SelectTimeZoneScreen(),
    // shareBusinessAndPersonal: (context) => SharePersonalAndBusiness(),
    // shareBusinessContact: (context) => const ShareBusinessContact(),
    // sharePersonalContact: (context) => SharePersonalContact(),
    // viewHomeProfile: (context) => const ViewHomeProfile(),
    // verifyPhoneNumber: (context) => const VerifyPhoneNumber(),
    // editUserProfile: (context) => const EditUserProfile(),
    // estateProfile: (context) => const EstateProfile(),
    // estateDetails: (context) => const EstateDetails(),
    // quickInvite: (context) => const QuickInvite(),
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Add your screen here as well as the transition you want
      case startScreen:
        return MaterialPageRoute(builder: (context) => StartScreen());

      // case phoneNumberScreen:
      //   return MaterialPageRoute(builder: (context) => PhoneNumberScreen());

      // case verifyScreen:
      //   return MaterialPageRoute(builder: (context) => VerificationScreen());

      // case splashScreen:
      //   return MaterialPageRoute(builder: (context) => SplashScreen());
      // case personalDetails:
      //   return MaterialPageRoute(builder: (context) => const PersonalDetails());
      // case identityPage:
      //   return MaterialPageRoute(builder: (context) => Identity());
      // case profilepictureandnametag:
      //   return MaterialPageRoute(
      //       builder: (context) => const Profilepictureandnametag());
      // case completedRegistration:
      //   return MaterialPageRoute(
      //       builder: (context) => const CompleteRegistration());
      // case contactList:
      //   return MaterialPageRoute(
      //       builder: (context) => const ContactlistScreen());
      // case homePage:
      //   return MaterialPageRoute(builder: (context) => HomeScreen());
      // case contactPersonalInformation:
      //   return MaterialPageRoute(
      //       builder: (context) => const ContactPersonalInformation());
      // case cameraScanScreen:
      //   return MaterialPageRoute(builder: (context) => CameraScanScreen());
      // case personalBusinessQrScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => PersonalBusinessQRScreen());
      // case userProfileScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const UserProfileScreen());
      // case workScreen:
      //   return MaterialPageRoute(builder: (context) => const WorkScreen());
      // case workForm:
      //   return MaterialPageRoute(builder: (context) => const WorkForm());
      // case workProfile:
      //   return MaterialPageRoute(builder: (context) => const WorkProfile());
      // case student:
      //   return MaterialPageRoute(builder: (context) => const Student());
      // case tertiaryStudentProfile:
      //   return MaterialPageRoute(
      //       builder: (context) => const TertiaryStudentProfile());
      // case secondaryStudentProfile:
      //   return MaterialPageRoute(
      //       builder: (context) => const SecondaryProfile());
      // case primaryStudentProfile:
      //   return MaterialPageRoute(builder: (context) => const PrimaryProfile());
      // case contactScreen:
      //   return MaterialPageRoute(builder: (context) => const ContactScreen());
      // case homeProfileScreen:
      //   return MaterialPageRoute(builder: (context) => const HomeProfile());
      // case settingScreen:
      //   return MaterialPageRoute(builder: (context) => const Settings());
      // case changePhoneNumber:
      //   return MaterialPageRoute(
      //       builder: (context) => const ChangePhoneNUmber());
      // case privacyScreen:
      //   return MaterialPageRoute(builder: (context) => const Privacy());
      // case deleteScreen:
      //   return MaterialPageRoute(builder: (context) => const Delete());
      // case deleteMyAccount:
      //   return MaterialPageRoute(builder: (context) => const DeleteMyAccount());
      // case deleteHome:
      //   return MaterialPageRoute(builder: (context) => const DeleteHome());
      // case deleteWork:
      //   return MaterialPageRoute(
      //       builder: (context) => const DeleteWorkProfile());
      // case deleteStudent:
      //   return MaterialPageRoute(
      //       builder: (context) => const DeleteStudentProfile());
      // case scanOption:
      //   return MaterialPageRoute(builder: (context) => const ScanOption());
      // case approvedResultScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const ApprovedResultScreen());
      // case appointmentDetails:
      //   return MaterialPageRoute(
      //       builder: (context) => const AppointmentDetails());
      // case notification_screen:
      //   return MaterialPageRoute(
      //       builder: (context) => const Notification_screen());
      // case contactRequestScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const ContactRequestScreen());
      // case appointmentScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const AppointmentScreen());
      // case rescheduleMeeting:
      //   return MaterialPageRoute(
      //       builder: (context) => const RescheduleMeeting());
      // case attendeeScreen:
      //   return MaterialPageRoute(builder: (context) => const Attendee_screen());
      // case userPin:
      //   return MaterialPageRoute(builder: (context) => const UserPin());
      // case newMeetingScreen:
      //   return MaterialPageRoute(builder: (context) => NewMeetingScreen());
      // case addAttendeeScreen:
      //   return MaterialPageRoute(builder: (context) => AddAtendeesScreen());
      // case calendarScreen:
      // // return MaterialPageRoute(builder: (context) => const CalendarScreen());
      // case timeZoneScreen:
      //   return MaterialPageRoute(builder: (context) => SelectTimeZoneScreen());
      // case shareBusinessAndPersonal:
      //   return MaterialPageRoute(
      //       builder: (context) => SharePersonalAndBusiness());
      // case shareBusinessContact:
      //   return MaterialPageRoute(
      //       builder: (context) => const ShareBusinessContact());
      // case sharePersonalContact:
      //   return MaterialPageRoute(builder: (context) => SharePersonalContact());
      // case viewHomeProfile:
      //   return MaterialPageRoute(builder: (context) => const ViewHomeProfile());
      // case verifyPhoneNumber:
      //   return MaterialPageRoute(
      //       builder: (context) => const VerifyPhoneNumber());
      // case editUserProfile:
      //   return MaterialPageRoute(builder: (context) => const EditUserProfile());
      // case estateProfile:
      //   return MaterialPageRoute(builder: (context) => const EstateProfile());
      // case estateDetails:
      //   return MaterialPageRoute(builder: (context) => const EstateDetails());
      // case quickInvite:
      //   return MaterialPageRoute(builder: (context) => const QuickInvite());
      //Default Route is error route
      default:
        return CupertinoPageRoute(
            builder: (context) => errorView(settings.name ?? 'Unknown Screen'));
    }
  }

  static Widget errorView(String name) {
    return Scaffold(body: Center(child: Text('404 $name View not found')));
  }
}
