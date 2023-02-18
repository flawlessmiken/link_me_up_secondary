// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/business_regitration_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:pinput/pinput.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../mixin/responsive_state/responsive_state.dart';
import '../../../size_config/size_config.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';

class EmailVerification extends StatelessWidget {
  final String? email;
  const EmailVerification({
    Key? key,
    this.email,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(
          title: 'Verify  Your Email',
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(SizeConfig.widthOf(5)),
            child: EmailVerificationform(email: "email"),
          ),
        ),
      ],
    ));
  }
}

class EmailVerificationform extends StatefulWidget {
  final String? email;
  const EmailVerificationform({
    Key? key,
    this.email,
  }) : super(key: key);

  @override
  State<EmailVerificationform> createState() => _EmailVerificationformState();
}

class _EmailVerificationformState extends State<EmailVerificationform> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final _key = GlobalKey<FormState>();
  bool hasError = false;
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
    final model = Provider.of<AuthRepository>(context);
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _key,
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/images/undraw_confirmed_81ex.png",
                  height: size.height / 4,
                  width: size.width / 0.5,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Please enter the OTP sent to \n ${widget.email}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                const SizedBox(
                  height: 40,
                ),
                Pinput(
                  // validator: (value) => model.validateOTP(value),
                  length: 4,
                  obscureText: true,
                  pinAnimationType: PinAnimationType.slide,
                  controller: _pinPutController,
                  focusNode: _pinPutFocusNode,
                  defaultPinTheme: defaultPinTheme,
                  forceErrorState: hasError,
                  showCursor: true,
                  cursor: cursor,
                  obscuringCharacter: '*',
                  preFilledWidget: preFilledWidget,
                ),
                SizedBox(
                  height: SizeConfig.heightOf(10),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              // print(widget.email);
              // await model.resendOtp(
              //   email: widget.email,
              // );

              //Navigator.pushNamed(context, RouteNames.verifyScreen);
            },
            child: RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                  text: 'Didn’t receive a code? ',
                  style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  children: const [
                    TextSpan(
                      text: 'Resend OTP',
                      style: TextStyle(color: Color(0xff25A244)),
                    ),
                  ]),
            ),
          ),
          vertical30,
          ResponsiveState(
            state: model.state,
            busyWidget: const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(strokeWidth: 6)),
            idleWidget: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () async {
                      // if (!_key.currentState.validate()) {
                      //   setState(() {
                      //     hasError = true;
                      //   });
                      //   return;
                      // }

                      // bool u = await model.validateOtp(
                      //   email: widget.email,
                      //   code: _pinPutController.text,
                      // );
                      // if (u) {
                      //   Navigator.pushNamed(
                      //       context, RouteNames.businessRegistration);
                      // }
                      Get.to(BusinessRegistration());
                    },
                    text: 'Proceed',
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          ),
          vertical30
        ],
      ),
    );
  }
}
