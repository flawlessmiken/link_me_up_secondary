import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/repositories/user_repository.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/constants/route_names.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/forgot_password/forgetPassword_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/home_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      backgroundColor: appPrimaryColor,
      body: Form(
        key: _key,
        child: Column(
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
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 20, horizontal: SizeConfig.widthOf(8)),
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
                        controller: emailController,
                        validator: (value) => authProv.validateEmail(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      vertical10,
                      CustomTextField(
                        hintText: "********",
                        labelText: "Password",
                        controller: passwordController,
                        obscureText: true,
                        validator: (value) => authProv.validatePassword(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      vertical30,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ForgotPassword());
                            },
                            child: Text(
                              "Forgot password ?",
                              style: txStyle14.copyWith(color: appPrimaryColor),
                            ),
                          )
                        ],
                      ),
                      vertical20,
                      ResponsiveState(
                        state: authProv.state,
                        busyWidget: Center(
                          child: CircularProgressIndicator(
                            color: appPrimaryColor,
                          ),
                        ),
                        idleWidget: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () async {
                                  if (!_key.currentState!.validate()) return;

                                  bool res = await authProv.Login(
                                      emailController.text,
                                      passwordController.text);

                                  if (res) {
                                    Get.offAll(HomeScreen());
                                    userProv.fetchUserInfo();
                                  }
                                },
                                backgroundColor: appPrimaryColor,
                                text: "Login",
                                textColor: Colors.white,
                                borderColor: appPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      vertical20,
                      Center(
                        child: RichText(
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
                        ),
                      ),
                      vertical30
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
