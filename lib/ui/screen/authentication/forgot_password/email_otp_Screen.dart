import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/forgot_password/reset_password.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/forgot_password/validate_pin_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import '../../../../api/core/repositories/auth_repository.dart';
import '../../../../constants/route_names.dart';

import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../../../mixin/responsive_state/responsive_state.dart';
import '../../../size_config/size_config.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';

class EmailOtp extends StatefulWidget {
  final String email;
  EmailOtp({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailOtp> createState() => _EmailOtpState();
}

class _EmailOtpState extends State<EmailOtp> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    // textStyle: GoogleFonts.poppins(
    //     fontSize: 22, color: Color.fromRGBO(30, 60, 87, 1)),
    decoration: BoxDecoration(),
  );
  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 40,
        height: 2,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 40,
        height: 2,
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'OTP Verification',
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
                          'assets/images/undraw_confirmed_81ex.png',
                          height: SizeConfig.heightOf(30),
                          width: SizeConfig.widthOf(30),
                        ),
                        SizedBox(height: SizeConfig.heightOf(5)),
                        Text(
                          'Enter the OTP sent to \n${widget.email}',
                          textAlign: TextAlign.center,
                          style: txStyle16,
                        ),
                        SizedBox(height: SizeConfig.heightOf(5)),
                        Pinput(
                          length: 6,
                          obscureText: true,
                          pinAnimationType: PinAnimationType.slide,
                          controller: _pinPutController,
                          focusNode: _pinPutFocusNode,
                          defaultPinTheme: defaultPinTheme,
                          showCursor: true,
                          cursor: cursor,
                          obscuringCharacter: '*',
                          preFilledWidget: preFilledWidget,
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      authProv.resendOTP(widget.email);
                    },
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: const TextSpan(
                          text: 'Didn’t receive a code? ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Resend OTP',
                              style: TextStyle(color: Color(0xff06D6A0)),
                            ),
                          ]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                              bool u = await authProv.validateForgotPasswordOTP(
                                  widget.email, _pinPutController.text);
                              // Get.to(ValidatePinScreen(email: widget.email));

                              if (u) {
                                Get.to(ValidatePinScreen(email: widget.email));
                              } else {
                                _pinPutController.clear();
                              }
                            },
                            text: 'Verify',
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
