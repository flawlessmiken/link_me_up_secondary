import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../widgets/app_bar.dart';

class StaffInformation extends StatelessWidget {
  const StaffInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Block user",
                      titlePadding: EdgeInsets.only(top: 20),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                      backgroundColor: Colors.white,
                      titleStyle: txStyle20,
                      barrierDismissible: true,
                      radius: 6,
                      content: Column(
                        children: [
                          Text(
                            "Are you sure you want to block user?",
                            textAlign: TextAlign.center,
                            style: txStyle14.copyWith(height: 1.5),
                          )
                        ],
                      ),
                      confirm: InkWell(
                        onTap: () async {
                         bool u = await userProv.blockAUser(
                              userProv.directoryDetailsModel.data!.id!);
                        if (u) {
                          Get.close(2);
                        }
                        },
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: appPrimaryColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                              child: Text(
                            "YES",
                            style: txStyle14wt,
                          )),
                        ),
                      ),
                      cancel: InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: appPrimaryColor),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Center(
                              child: Text(
                            "NO",
                            style: txStyle14,
                          )),
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.block,
                    color: Color(0XFFF30101),
                  ))
            ],
          ),
          ResponsiveState(
            state: userProv.state,
            busyWidget: Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
            ),
            idleWidget: Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: SizeConfig.widthOf(4)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: UserImageIcon(
                          imageUrl:
                              "${userProv.directoryDetailsModel.data?.profilePicture}",
                          radius: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          capitalizeFirstText(
                              "${userProv.directoryDetailsModel.data?.firstName} ${userProv.directoryDetailsModel.data?.lastName}"),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Center(
                        child: Text(
                          "@${userProv.directoryDetailsModel.data?.nameTag}",
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ),
                      vertical20,
                      Center(
                          child: Text('Staff',
                              style: TextStyle(
                                fontSize: 18,
                              ))),
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Personal Contact', style: txStyle14),
                      SmallCustomTextField(
                        labelText: 'phone',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.personalContact?.phoneNumber}",
                      ),
                      vertical10,
                      SmallCustomTextField(
                        labelText: 'Email',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.personalContact?.email}",
                      ),
                      vertical10,

                      SmallCustomTextField(
                        labelText: 'Personal website',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.personalContact?.website}",
                      ),
                      vertical10,

                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Business Contact',
                        style: txStyle14,
                      ),
                      SmallCustomTextField(
                        labelText: 'Phone number',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.businessContact?.mobilePhoneNumber}",
                      ),
                      vertical10,

                      SmallCustomTextField(
                        labelText: 'Direct line',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.businessContact?.officePhoneNumber}",
                      ),
                      vertical10,

                      SmallCustomTextField(
                        labelText: 'Email',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.businessContact?.workEmailAddress}",
                      ),
                      vertical10,

                      SmallCustomTextField(
                        labelText: 'Designation',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.businessContact?.designation}",
                      ),
                      vertical10,

                      SmallCustomTextField(
                        labelText: 'Department',
                        readOnly: true,
                        hintText:
                            "${userProv.directoryDetailsModel.data?.businessContact?.department}",
                      ),
                      // SmallCustomTextField(
                      //   labelText: 'Company name',
                      //   readOnly: true,
                      //   hintText: "${userProv.directoryDetailsModel.data?.?.mobilePhoneNumber}",
                      // ),
                      // SmallCustomTextField(
                      //   labelText: 'Company name tag',
                      //   readOnly: true,
                      //   hintText: '@Unilag',
                      // ),
                      // SmallCustomTextField(
                      //   labelText: 'Company website',
                      //   readOnly: true,
                      //   hintText: 'www.unilag.edu',
                      // ),
                      // SmallCustomTextField(
                      //   labelText: 'Company  Address',
                      //   readOnly: true,
                      //   hintText: '2343 Akoka, Yaba, Lagos, Nigeria',
                      // ),
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
