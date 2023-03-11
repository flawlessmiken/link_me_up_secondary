// import 'package:get_it/get_it.dart';

import 'package:get_it/get_it.dart';
import 'package:link_me_up_secondary/api/api_utils/api_helper.dart';
import 'package:link_me_up_secondary/api/authentication_api/authentication_api.dart';
import 'package:link_me_up_secondary/api/authentication_api/authentication_implementation.dart';
import 'package:link_me_up_secondary/api/user_api/user_api.dart';
import 'package:link_me_up_secondary/api/user_api/user_implementation.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  // // services
  locator.registerLazySingleton<API>(() => API());

  locator.registerLazySingleton<AUthenticationApi>(
      () => AUthenticationApiImplementation());
  locator.registerLazySingleton<UserApi>(() => UserApiImplantation());
}
