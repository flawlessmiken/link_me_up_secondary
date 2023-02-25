import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/add_payment_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';

class SubscriptionDetails extends StatelessWidget {
  const SubscriptionDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: ""),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView(
                  children: [
                    Center(
                      child: Text(
                        'Business\nPremium Plan Features',
                        textAlign: TextAlign.center,
                        style: txStyle17Bold.copyWith(fontSize: 18),
                      ),
                    ),
                    vertical25,
                    Text(
                      'General services',
                      style: txStyle16,
                    ),
                    vertical20,
                    Text(
                      'Multi-user ',
                      style: txStyle16,
                    ),
                    Text(
                      '• Administrator\n• Sub- administrator• Reception\n• Security\n',
                      style: txStyle16,
                    ),
                    vertical20,
                    Text(
                      'Clock in and clock out ',
                      style: txStyle16,
                    ),
                    Text(
                      '• Guest\n• Staff\n',
                      style: txStyle16,
                    ),
                    vertical20,
                    Text(
                      'My Order',
                      style: txStyle16,
                    ),
                    Text(
                      '• Business cards\n• Identity cards\n• Stickers\n• Wall frames\n',
                      style: txStyle16,
                    ),
                    vertical20,
                    Text(
                      'Guest information details ',
                      style: txStyle16,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {
                      Get.to(AddPaymentDetails());
                    },
                    text: "Subscribe",
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightOf(3),
          )
        ],
      ),
    );
  }
}
