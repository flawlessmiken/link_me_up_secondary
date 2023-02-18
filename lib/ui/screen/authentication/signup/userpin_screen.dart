// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/email_verification_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../mixin/responsive_state/responsive_state.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class UserPin extends StatefulWidget {
  final String? FirstName;
  final String? LastName;
  final String? Email;
  final String? PhoneNumber;
  final String? password;
  final String? ConfrirmPassword;
  final String? image;
  const UserPin({
    Key? key,
    this.image,
    this.FirstName,
    this.LastName,
    this.Email,
    this.PhoneNumber,
    this.password,
    this.ConfrirmPassword,
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
    final model = Provider.of<AuthRepository>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Form(
      key: _key,
      child: Column(
        children: [
          CustomAppBar(title: 'Create Pin'),
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
                      labelText: 'Enter Pin',
                      hintText: '*******',
                      controller: pin1Controller,
                      obscureText: true,
                      textInputType: TextInputType.number,
                      // validator: (value) => model.validatePin(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    vertical30,
                    CustomTextField(
                      labelText: 'Confirm Pin',
                      hintText: '*******',
                      obscureText: true,
                      // isPin: true,
                      controller: pin2Controller,
                      textInputType: TextInputType.number,
                      // validator: (value) => model.validatePin(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    vertical30,
                    ResponsiveState(
                      state: model.state,
                      busyWidget: Center(
                        child: const SizedBox(
                            height: 30,
                            width: 30,
                            child: CircularProgressIndicator(strokeWidth: 6)),
                      ),
                      idleWidget: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () async {
                                // if (!_key.currentState.validate()) return;
                        
                                // bool u = await model.adminRegistration(
                                //   image: widget.image,
                                //   FirstName: widget.FirstName,
                                //   LastName: widget.LastName,
                                //   PhoneNumber: widget.PhoneNumber,
                                //   Email: widget.Email,
                                //   password: widget.password,
                                //   ConfrirmPassword: widget.ConfrirmPassword,
                                //   PIN: pin1Controller.text,
                                //   ConfirmPIN: pin2Controller.text,
                                //   deviceId: deviceId,
                                //   deviceType: deviceType,
                                // );
                        
                                // if (u) {
                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) =>
                                //               EmailVerification(
                                //                   email: widget.Email)));
                                // }

                                Get.to(EmailVerification());
                              },
                              text: 'Create Pin',
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
