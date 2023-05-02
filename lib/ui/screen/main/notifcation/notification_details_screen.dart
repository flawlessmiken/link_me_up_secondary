import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/notifcation/staff_request_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:provider/provider.dart';

import '../../../../api/repositories/user_repository.dart';
import '../../../widgets/utils.dart';

class NotificationDetailsScreen extends StatefulWidget {
  const NotificationDetailsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationDetailsScreen> createState() =>
      _NotificationDetailsScreenState();
}

class _NotificationDetailsScreenState extends State<NotificationDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(3)),
          child: Column(
            children: [
              vertical10,
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                  horizontalx10,
                  UserImageIcon(
                    imageUrl:
                        "${userProv.notificationDetailsModel.data?.picture}",
                    radius: 40,
                  ),
                  horizontalx10,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        capitalizeFirstText(
                            "${userProv.notificationDetailsModel.data?.title}"),
                        style: txStyle14Bold,
                      ),
                      Text(
                        "@${userProv.notificationDetailsModel.data?.nameTag}",
                        style: txStyle14.copyWith(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
              Divider(),
              ResponsiveState(
                state: userProv.state,
                busyWidget: const Center(
                  child: CircularProgressIndicator(
                    color: appPrimaryColor,
                  ),
                ),
                idleWidget: Column(
                  children: [
                    Container(
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        color: appPrimaryColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                toBeginningOfSentenceCase(userProv
                                    .notificationDetailsModel.data?.body)!,
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: SizeConfig.heightOf(4),
                                ),
                                const Divider(
                                  color: Colors.white,
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: SizeConfig.heightOf(1),
                                ),
                                InkWell(
                                  onTap: () {
                                    log("${userProv.notificationDetailsModel.data?.data}");
                                    userProv.getEnrolmentRequestDetails(
                                        "${userProv.notificationDetailsModel.data?.data}");
                                    Get.to(StaffEnrolmentRequest());
                                  },
                                  child: Center(
                                    child: Text(
                                      'View request',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    vertical5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            DateFormat.MMMMd().format(userProv
                                    .notificationDetailsModel.data?.createdAt ??
                                DateTime.now()),
                            style:
                                TextStyle(fontSize: 12, color: appPrimaryColor),
                          ),
                        )
                      ],
                    ),
                    vertical10,
                    userProv.notificationStatus == "accepted"
                        ? Column(
                            children: [
                              Container(
                                width: SizeConfig.screenWidth,
                                decoration: BoxDecoration(
                                  color: Color(0xffF4F4F7),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          toBeginningOfSentenceCase(
                                              "staff enrolment request accepted")!,
                                          style: txStyle15,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: SizeConfig.heightOf(4),
                                          ),
                                          const Divider(
                                            color: appPrimaryColor,
                                            thickness: 3,
                                          ),
                                          SizedBox(
                                            height: SizeConfig.heightOf(1),
                                          ),
                                          Center(
                                            child: Text(
                                              'View Staff',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              vertical5,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      DateFormat.MMMMd().format(userProv
                                              .notificationDetailsModel
                                              .data
                                              ?.createdAt ??
                                          DateTime.now()),
                                      style: TextStyle(
                                          fontSize: 12, color: appPrimaryColor),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        : userProv.notificationStatus == "declined"
                            ? Column(
                                children: [
                                  Container(
                                    width: SizeConfig.screenWidth,
                                    decoration: BoxDecoration(
                                      color: Color(0xffF4F4F7),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child:const  Padding(
                                      padding:  EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 30),
                                      child: Text(
                                        "Staff enrollment request declined",
                                        style: txStyle14,
                                      ),
                                    ),
                                  ),
                                  vertical5,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          DateFormat.MMMMd().format(userProv
                                                  .notificationDetailsModel
                                                  .data
                                                  ?.createdAt ??
                                              DateTime.now()),
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: appPrimaryColor),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            : SizedBox.shrink(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
