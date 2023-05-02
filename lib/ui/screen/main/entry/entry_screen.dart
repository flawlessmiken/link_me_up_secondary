import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/models/pusher_get_entry_model.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../api/repositories/pusher_repository.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pusherProv = Provider.of<PusherRepository>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "",
              leading: IconButton(
                  onPressed: () {
                    Get.close(1);
                  },
                  icon: Icon(Icons.close)),
            ),
            Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
                child: Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: UserImageIcon(
                          imageUrl:
                              "${pusherProv.pusherGetEntryModel.profilePicture}",
                          radius: 120,
                        ),
                      ),
                      vertical10,
                      Text(
                        capitalizeFirstText(
                            "${pusherProv.pusherGetEntryModel.firstName}"
                            " ${pusherProv.pusherGetEntryModel.lastName}"),
                        style: txStyle16,
                      ),
                      vertical5,
                      Text(
                        "@${pusherProv.pusherGetEntryModel.nameTag}",
                        style: txStyle12.copyWith(color: Colors.grey),
                      ),
                      vertical30,
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: appPrimaryColor, width: 1.5),
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.done,
                            color: appPrimaryColor,
                            size: 35,
                          ),
                        ),
                      ),
                      vertical20,
                      Text(
                        "Guest",
                        style: txStyle16,
                      ),
                      Spacer(),
                      pusherProv.pusherGetEntryModel.appointmentid!.isEmpty
                          ? SizedBox.shrink()
                          : Row(
                              children: [
                                Expanded(
                                  child: CustomButton(
                                    backgroundColor: Colors.white,
                                    onPressed: () {},
                                    text: "View appointment",
                                    textColor: appPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                      vertical20,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () {},
                              text: "In",
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      vertical20,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              backgroundColor: Colors.white,
                              onPressed: () {},
                              text: "Out",
                              borderColor: Color(0xffF30101),
                              textColor: Color(0xffF30101),
                            ),
                          ),
                        ],
                      ),
                      vertical20,
                      Text(
                        "Dismiss",
                        style: txStyle16,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
