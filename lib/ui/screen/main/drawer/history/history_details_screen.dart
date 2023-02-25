import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/history/appointment_list.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/history/contact_information_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/history/entry_details_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';

class HistoryDetailsScreen extends StatefulWidget {
  const HistoryDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HistoryDetailsScreen> createState() => _HistoryDetailsScreenState();
}

class _HistoryDetailsScreenState extends State<HistoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: ""),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UserImageIcon(
                      imageUrl:
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
                      radius: 120,
                    ),
                    vertical10,
                    Text(
                      "Chiamaka Odum",
                      style: txStyle16Bold.copyWith(fontSize: 18),
                    ),
                    Text(
                      "@chiamakaodum22",
                      style: txStyle12.copyWith(color: Colors.grey),
                    ),
                    vertical30,
                    Text(
                      "Guest",
                      style: txStyle16Bold.copyWith(fontSize: 18),
                    ),
                    vertical30,
                    InkWell(
                      onTap: () {
                        Get.to(ContactDetails());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contact information",
                            style: txStyle16,
                          ),
                          Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                                        vertical30,

                    InkWell(
                      onTap: () {
                        Get.to(EntryDetails());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of entry(s)",
                            style: txStyle16,
                          ),
                          Row(
                            children: [
                              Text(
                                "3",
                                style: txStyle16,
                              ),
                              Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          )
                        ],
                      ),
                    ),
                    vertical30,
                    InkWell(
                      onTap: () {
                        Get.to(AppointmentList());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Number of appointment(s)",
                            style: txStyle16,
                          ),
                          Row(
                            children: [
                              Text(
                                "3",
                                style: txStyle16,
                              ),
                               Icon(Icons.arrow_forward_ios_outlined)
                            ],
                          )
                        ],
                      ),
                    ),
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
