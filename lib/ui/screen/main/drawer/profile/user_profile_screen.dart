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

import '../../../../../api/core/repositories/user_repository.dart';
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
    final userProv = Provider.of<UserRepository>(context);

    // final user = Provider.of<UserRepository>(context);
    // IndividualUerModel userProfile = user.inidividualUserData;
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Profile',
          ),
          ResponsiveState(
            state: userProv.state,
            busyWidget: const Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
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
                            "${userProv.secondaryAccountInfo.data?.picture}",
                        radius: 120,
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${userProv.secondaryAccountInfo.data?.name}",
                        style: txStyle16,
                      ),
                      Text(
                        "@${userProv.secondaryAccountInfo.data?.nameTag}",
                        style: txStyle12.copyWith(color: Colors.grey),
                      ),
                      vertical20,
                      SmallCustomTextField(
                        labelText: "Category",
                        hintText:
                            "${userProv.secondaryAccountInfo.data?.category}",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Phone number",
                        hintText:
                            "${userProv.secondaryAccountInfo.data?.phoneNumber}",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Email",
                        hintText:
                            "${userProv.secondaryAccountInfo.data?.email}",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Official Website",
                        hintText:
                            "${userProv.secondaryAccountInfo.data?.website}",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SmallCustomTextField(
                        labelText: "Address",
                        hintText:
                            "${userProv.secondaryAccountInfo.data?.address}",
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
                                            ResponsiveState(
                                              state: userProv.state,
                                              busyWidget: Center(
                                                child:
                                                    CircularProgressIndicator(
                                                  color: appPrimaryColor,
                                                ),
                                              ),
                                              idleWidget: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.5)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 10,
                                                        vertical: 5),
                                                    child: Pinput(
                                                      // validator: (value) => model.validateOTP(value),
                                                      length: 6,
                                                      obscureText: true,
                                                      pinAnimationType:
                                                          PinAnimationType
                                                              .slide,
                                                      controller:
                                                          _pinPutController,
                                                      focusNode:
                                                          _pinPutFocusNode,
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
                                              ),
                                            ),
                                            vertical20,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () async {
                                                    Get.close(1);

                                                    bool u = await userProv
                                                        .validateUserPin(
                                                            _pinPutController
                                                                .text);
                                                    if (u) {
                                                      Get.to(EditProfile());
                                                    }
                                                    _pinPutController.clear();
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
                                                InkWell(
                                                  onTap: () {
                                                    Get.close(1);
                                                  },
                                                  child: Container(
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
