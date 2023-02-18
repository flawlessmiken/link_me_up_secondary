import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/admin_details_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';

import '../../../constants/route_names.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreenState();
}

class _LoginSignUpScreenState extends State<LoginSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              vertical50,
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: EdgeInsets.only(right: 35),
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                          height: 65,
                          width: 90,
                        ),
                      ),
                    ),
                    vertical5,
                    Text(
                      "Linkmeup Security ",
                      style: txStyle17Boldwt.copyWith(fontSize: 18),
                    ),
                    vertical5,
                    Text(
                      "Identity & Access management",
                      style: txStyle16Boldwt,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Container(
                width: SizeConfig.screenWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 50, horizontal: SizeConfig.widthOf(8)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Linkmeup Security",
                        style: txStyle27Bold.copyWith(color: appPrimaryColor),
                      ),
                      vertical10,
                      Text(
                        "Experience a secure world,\neveryday.",
                        textAlign: TextAlign.center,
                        style: txStyle20,
                      ),
                      vertical50,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {
                                Get.toNamed(RouteNames.loginScreen);

                              },
                              backgroundColor: appPrimaryColor,
                              text: "Login",
                              textColor: Colors.white,
                              borderColor: appPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      vertical20,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {
                                Get.to(AdminRegistration());
                              },
                              backgroundColor: Colors.white,
                              text: "Register",
                              textColor: Colors.black,
                              borderColor: appPrimaryColor,
                            ),
                          ),
                        ],
                      ),

                      vertical50
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                // height: 200,
                // width: 100,
                // color: Colors.accents,
                child: SvgPicture.asset(
                  'assets/ellipse.svg',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
