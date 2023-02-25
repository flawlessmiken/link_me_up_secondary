import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/subscription/subscription_details_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';

class BusinessSubscription extends StatelessWidget {
  const BusinessSubscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Business',
          ),
          Column(
            children: [
              subscription_plan(
                title: 'Standard plan',
                subtitle: '\$100/month',
              ),
              subscription_plan(
                title: 'Premium plan',
                subtitle: '\$150/month',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class subscription_plan extends StatelessWidget {
  final String title;
  final String subtitle;
  const subscription_plan({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        activeColor: appPrimaryColor,
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        value: true,
        onChanged: (bool? value) {
          Get.to(SubscriptionDetails());
        });
  }
}
