import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/constants/route_names.dart';
import 'package:link_me_up_secondary/ui/screen/main/home_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthOf(4)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: SvgPicture.asset(
                                  "assets/ArrowCircleLeft.svg",
                                  height: 32,
                                  width: 32,
                                ),
                              )
                            ],
                          ),
                          vertical50,
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(right: 35),
                              child: SvgPicture.asset(
                                'assets/logo.svg',
                                height: 119,
                                width: 167,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: SizeConfig.screenWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(50))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 50, horizontal: SizeConfig.widthOf(8)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView(
                  shrinkWrap: true,
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in",
                      style: txStyle27,
                    ),
                    vertical30,
                    CustomTextField(
                      hintText: "linkmeup@2020",
                      labelText: "Username",
                    ),
                    vertical10,
                    CustomTextField(
                      hintText: "********",
                      labelText: "Password",
                    ),
                    vertical30,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Forgot password ?",
                          style: txStyle14.copyWith(color: appPrimaryColor),
                        )
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              Get.offAll(HomeScreen());
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Don’t have an account? ',
                            style: txStyle14,
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Sign up',
                                  style: txStyle14.copyWith(
                                      color: appPrimaryColor)),
                            ],
                          ),
                        )
                      ],
                    ),
                    vertical30
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
