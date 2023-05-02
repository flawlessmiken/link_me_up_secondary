import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/forgot_password/validate_pin_screen.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/login/login_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import '../../../../api/repositories/auth_repository.dart';
import '../../../../constants/route_names.dart';

import '../../../responsive_state/responsive_state.dart';
import '../../../size_config/size_config.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';

import 'package:provider/provider.dart';

import '../../../widgets/custom_textfield.dart';

class ResetPassword extends StatefulWidget {
  final String email;
  ResetPassword({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);

    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Forget Password',
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Image.asset(
                            'assets/images/undraw_confirmed_81ex.png',
                            height: SizeConfig.heightOf(30),
                            width: SizeConfig.widthOf(30),
                          ),
                          SizedBox(
                            height: SizeConfig.heightOf(5),
                          ),
                          Text(
                              'Kindly create a new password \nmake sure your pass is secure ',
                              textAlign: TextAlign.center),
                          SizedBox(
                            height: SizeConfig.heightOf(5),
                          ),
                          CustomTextField(
                            obscureText: true,
                            labelText: 'New password',
                            controller: passwordController,
                            validator: (value) =>
                                authProv.validatePassword(value!),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          vertical20,
                          CustomTextField(
                            obscureText: true,
                            labelText: 'Confirm password',
                            controller: confirmPasswordController,
                            validator: (value) =>
                                authProv.confirmPassword(value!),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     // Get.to(ResetPin(
                          //     //   email: widget.email,
                          //     // ));
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 10, vertical: 10),
                          //     child: Row(
                          //       mainAxisAlignment: MainAxisAlignment.end,
                          //       children: [
                          //         Text(
                          //           'Forgot pin? Click here',
                          //           style: TextStyle(
                          //               color: Theme.of(context).primaryColor,
                          //               fontSize: 12),
                          //         )
                          //       ],
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    ResponsiveState(
                      state: authProv.state,
                      busyWidget: const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: appPrimaryColor,
                          )),
                      idleWidget: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () async {
                                if (!_key.currentState!.validate()) return;

                                bool u = await authProv.changePassword(
                                    passwordController.text,
                                    confirmPasswordController.text);

                                if (u) {
                                  Get.to(LoginScreen());
                                }
                              },
                              text: 'Finish',
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    vertical30
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
