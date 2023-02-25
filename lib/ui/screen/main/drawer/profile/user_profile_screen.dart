import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/view_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/profile/edit_profile.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:pinput/pinput.dart';

import 'package:provider/provider.dart';

import '../../../../mixin/responsive_state/responsive_state.dart';
import '../../../../size_config/size_config.dart';
import '../../../../styles/text_styles.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';

class UserProfileScreen extends StatefulWidget {
  final String? ID;
  const UserProfileScreen({
    Key? key,
    this.ID,
  }) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
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
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      // final user = Provider.of<UserRepository>(context, listen: false);
      // user.fetchIndividualUserProfile(widget.ID);
    });
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserRepository>(context);
    // IndividualUerModel userProfile = user.inidividualUserData;
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'profile',
          ),
          ResponsiveState(
            state: ViewState.Idle,
            busyWidget: const Center(
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(strokeWidth: 6)),
            ),
            idleWidget: Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                          child: UserImageIcon(
                        imageUrl:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
                        radius: 120,
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MTN",
                        style: txStyle16,
                      ),
                      Text(
                        "@mtn",
                        style: txStyle12.copyWith(color: Colors.grey),
                      ),
                      SmallCustomTextField(
                        labelText: "Category",
                        hintText: "Business",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Phone number",
                        hintText: "+2349031129609",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Email",
                        hintText: "MTN@mtn.com.ng",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Official Website",
                        hintText: "www.mtn.com",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Address",
                        hintText: "Plot 233, MTN PLAZA",
                        readOnly: true,
                      ),
                      SizedBox(
                        height: SizeConfig.heightOf(5),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {},
                              text: "Show QR code",
                              backgroundColor: Colors.white,
                              textColor: appPrimaryColor,
                              borderColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {
                                showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: appPrimaryColor),
                                              child: Center(
                                                child: Text(
                                                  "LMU SECURITY",
                                                  style: txStyle14wt,
                                                ),
                                              ),
                                            ),
                                            vertical20,
                                            Text(
                                              "Please enter your pin",
                                              style: txStyle16.copyWith(
                                                  color: Color(0xffE41521)),
                                            ),
                                            vertical20,
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Pinput(
                                                  // validator: (value) => model.validateOTP(value),
                                                  length: 4,
                                                  obscureText: true,
                                                  pinAnimationType:
                                                      PinAnimationType.slide,
                                                  controller: _pinPutController,
                                                  focusNode: _pinPutFocusNode,
                                                  defaultPinTheme:
                                                      defaultPinTheme,
                                                  forceErrorState: hasError,
                                                  showCursor: true,
                                                  cursor: cursor,
                                                  obscuringCharacter: '*',
                                                  preFilledWidget:
                                                      preFilledWidget,
                                                ),
                                              ),
                                            ),
                                            vertical20,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Get.to(EditProfile());
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: appPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "Verify",
                                                      style: txStyle14wt,
                                                    )),
                                                  ),
                                                ),
                                                horizontalx20,
                                                Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffE41521),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "Cancel",
                                                    style: txStyle14wt,
                                                  )),
                                                ),
                                              ],
                                            ),
                                            vertical20,
                                          ],
                                        ),
                                      );
                                    });
                              },
                              text: 'Edit',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
