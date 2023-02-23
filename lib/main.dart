import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'constants/providers.dart';
import 'constants/route_names.dart';
import 'theme/app_theme_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(LinkMeUpPrimary());
}

class LinkMeUpPrimary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return MultiProvider(
      // holds all instances of providers that would be used for this application
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        
        title: 'Link Me Up',
        theme: appThemeLight,
        routes: RouteNames.routes,
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: RouteNames.generateRoute,
        navigatorKey: Get.key,
      ),
    );
  }
}
