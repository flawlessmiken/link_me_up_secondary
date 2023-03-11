// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/forgot_password/email_otp_Screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../size_config/size_config.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Forget Password',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        vertical30,
                        Image.asset(
                          'assets/images/undraw_confirmed_81ex.png',
                          height: SizeConfig.heightOf(30),
                          width: SizeConfig.widthOf(30),
                        ),
                        SizedBox(
                          height: SizeConfig.heightOf(5),
                        ),
                        const Text(
                          'Please kindly enter your registered email\naddress to recover your password',
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: SizeConfig.heightOf(5),
                        ),
                        CustomTextField(
                          labelText: 'Enter your email address',
                          hintText: 'example@linkmeup.com',
                          controller: emailController,
                        ),
                      ],
                    ),
                  ),
                  vertical20,
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
                              bool u = await authProv
                                  .forgotPassword(emailController.text);
                              if (u) {
                                Get.to(EmailOtp(email: emailController.text));
                              }
                            },
                            text: 'Reset Password',
                            backgroundColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  vertical30,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
