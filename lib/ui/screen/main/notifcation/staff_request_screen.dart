import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:provider/provider.dart';

import '../../../../api/repositories/user_repository.dart';

class StaffEnrolmentRequest extends StatefulWidget {
  const StaffEnrolmentRequest({Key? key}) : super(key: key);

  @override
  State<StaffEnrolmentRequest> createState() => _StaffEnrolmentRequestState();
}

class _StaffEnrolmentRequestState extends State<StaffEnrolmentRequest> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Staff Enrolment"),
          ResponsiveState(
            state: userProv.state,
            busyWidget: Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
            ),
            idleWidget: Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
                child: Column(
                  children: [
                    Expanded(
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView(
                          children: [
                            vertical20,
                            Center(
                              child: UserImageIcon(
                                  radius: 120,
                                  imageUrl:
                                      "${userProv.enrolmentRequestModel.data?.profilePicture}"),
                            ),
                            vertical30,
                            Text(
                              "Staff Details",
                              style: txStyle14Bold,
                            ),
                            vertical10,
                            SmallCustomTextField(
                              labelText: "Phone number",
                              hintText:
                                  "${userProv.enrolmentRequestModel.data?.mobilePhoneNumber}",
                            ),
                            vertical10,
                            SmallCustomTextField(
                              labelText: "Email",
                              hintText:
                                  "${userProv.enrolmentRequestModel.data?.workEmailAddress}",
                            ),
                            "${userProv.enrolmentRequestModel.data?.staffNumber}" ==
                                    "null"
                                ? SizedBox.shrink()
                                : Column(
                                    children: [
                                      vertical10,
                                      SmallCustomTextField(
                                        labelText: "Staff number",
                                        hintText:
                                            ("${userProv.enrolmentRequestModel.data?.staffNumber}"),
                                      ),
                                    ],
                                  ),
                            vertical10,
                            SmallCustomTextField(
                              labelText: "Designation",
                              hintText: toBeginningOfSentenceCase(
                                  "${userProv.enrolmentRequestModel.data?.designation}"),
                            ),
                            vertical10,
                            SmallCustomTextField(
                              labelText: "Department",
                              hintText: toBeginningOfSentenceCase(
                                  "${userProv.enrolmentRequestModel.data?.department}"),
                            ),
                            vertical10,
                            SmallCustomTextField(
                              labelText: "Office phone number",
                              hintText:
                                  "${userProv.enrolmentRequestModel.data?.officePhoneNumber}",
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            // Get.to(page)
                            bool u = await userProv.acceptEnrolmentRequest(
                                "${userProv.enrolmentRequestModel.data?.id}");

                            if (u) {
                              userProv.fetchNotification();

                              Get.close(2);
                            }
                          },
                          child: Text(
                            "Accept",
                            style: txStyle16Bold.copyWith(
                                fontSize: 18, color: appPrimaryColor),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            bool u = await userProv.declineEnrolment(
                                "${userProv.enrolmentRequestModel.data?.id}");

                            if (u) {
                              userProv.fetchNotification();
                              Get.close(2);
                            }
                          },
                          child: Text(
                            "Decline",
                            style: txStyle16Bold.copyWith(
                                fontSize: 18, color: Color(0xffE41521)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightOf(4),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
