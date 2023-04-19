import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../../constants/colors.dart';
import '../../../../mixin/responsive_state/responsive_state.dart';
import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';

class ContactDetailsScreen extends StatefulWidget {
final   String id;
  const ContactDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ContactDetailsScreen> createState() => _ContactDetailsScreenState();
}

class _ContactDetailsScreenState extends State<ContactDetailsScreen> {
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
                              widget.id);
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
                                "${userProv.contactDetailsModel.data?.profilePicture}",
                            radius: 120,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            capitalizeFirstText(
                                "${userProv.contactDetailsModel.data?.firstName} ${userProv.contactDetailsModel.data?.lastName}"),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Center(
                          child: Text(
                            "@${userProv.contactDetailsModel.data?.nameTag}",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        vertical30,
                        Text(
                          "Personal Contact",
                          style: txStyle16,
                        ),
                        vertical10,
                        SmallCustomTextField(
                          labelText: "Phone number",
                          hintText:
                              "${userProv.contactDetailsModel.data?.personalContact?.phoneNumber}",
                        ),
                        vertical10,
                        SmallCustomTextField(
                          labelText: "Email",
                          hintText:
                              "${userProv.contactDetailsModel.data?.personalContact?.email}",
                        ),
                        vertical10,
                        SmallCustomTextField(
                          labelText: "Personal website",
                          hintText:
                              "${userProv.contactDetailsModel.data?.personalContact?.website}",
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
