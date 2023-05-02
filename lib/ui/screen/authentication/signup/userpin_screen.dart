// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/email_verification_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import 'package:provider/provider.dart';

import '../../../../api/repositories/auth_repository.dart';
import '../../../responsive_state/responsive_state.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class UserPin extends StatefulWidget {
  final String email;
  const UserPin({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<UserPin> createState() => _UserPinState();
}

class _UserPinState extends State<UserPin> {
  final TextEditingController pin1Controller = TextEditingController();
  final TextEditingController pin2Controller = TextEditingController();
  final _key = GlobalKey<FormState>();
  String deviceType = "";
  String deviceId = "";

  // Future<String> _getId() async {
  //   var deviceInfo = DeviceInfoPlugin();
  //   if (Platform.isIOS) {
  //     // import 'dart:io'
  //     var iosDeviceInfo = await deviceInfo.iosInfo;
  //     setState(() {
  //       deviceType = "IOS";
  //       deviceId = iosDeviceInfo.identifierForVendor;
  //     });
  //     // unique ID on iOS
  //   } else if (Platform.isAndroid) {
  //     var androidDeviceInfo = await deviceInfo.androidInfo;
  //     setState(() {
  //       deviceType = "ANDROID";
  //       deviceId = androidDeviceInfo.androidId;
  //     });
  //     // unique ID on Android
  //   }
  // }

  // @override
  // void initState() {
  //   _getId();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _key,
      child: Column(
        children: [
          CustomAppBar(title: 'Create PIN'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/pins.png",
                      height: size.height / 4,
                      width: size.width / 0.5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Please enter your secret pin to\nsecure your information',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      labelText: 'Enter PIN',
                      hintText: '*******',
                      controller: pin1Controller,
                      obscureText: true,
                      textInputType: TextInputType.number,
                      validator: (value) => authProv.validatePIN(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    vertical30,
                    CustomTextField(
                      labelText: 'Confirm PIN',
                      hintText: '*******',
                      obscureText: true,
                      // isPin: true,
                      controller: pin2Controller,
                      textInputType: TextInputType.number,
                      validator: (value) => authProv.confirmPin(value!),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    vertical30,
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

                                bool res = await authProv.createPin(
                                    pin1Controller.text,
                                    pin2Controller.text);

                                if (res) {
                                  Get.to(EmailVerification(
                                    email: widget.email,
                                  ));
                                }
                              },
                              text: 'Create PIN',
                              backgroundColor: appPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
