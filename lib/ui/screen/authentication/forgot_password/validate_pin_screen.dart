// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/forgot_password/reset_password.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../mixin/responsive_state/responsive_state.dart';
import '../../../size_config/size_config.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class ValidatePinScreen extends StatefulWidget {
  final String email;
  ValidatePinScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<ValidatePinScreen> createState() => _ValidatePinScreenState();
}

class _ValidatePinScreenState extends State<ValidatePinScreen> {
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Enter Pin',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Image.asset(
                          'assets/images/pins.png',
                          height: SizeConfig.heightOf(30),
                          width: SizeConfig.widthOf(30),
                        ),
                        SizedBox(
                          height: SizeConfig.heightOf(5),
                        ),
                        Text(
                            'Please enter your secret pin to validate \n your information',
                            textAlign: TextAlign.center),
                        SizedBox(
                          height: SizeConfig.heightOf(5),
                        ),
                        CustomTextField(
                          obscureText: true,
                          labelText: 'Enter Pin',
                          controller: pinController,
                        ),
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
                              bool u = await authProv.validateForgotPasswordPIN(
                                  pinController.text);
                              if (u) {
                                Get.to(ResetPassword(email: widget.email));
                              }
                            },
                            text: 'Verify',
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
    );
  }
}
