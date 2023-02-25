import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import '../../../../../constants/route_names.dart';

import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import 'add_payment_screen.dart';
import 'order_directory_screen.dart';

class BusinessCard extends StatelessWidget {
  const BusinessCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'My order',
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/business_card.png',
                      height: 500,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Linkmeup business card',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    vertical20,
                    Text(
                      'Specification',
                      style: txStyle16,
                    ),
                    Text(
                      'Dimension: H2 * w4',
                      style: txStyle16,
                    ),
                    Text(
                      'Quantity : 200 peices',
                      style: txStyle16,
                    ),
                    Text(
                      'Amount: \$50.00',
                      style: txStyle16,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'Order now',
                            onPressed: () {
                                                  Get.to(OrderDirectoryScreen());


                            },
                          ),
                        )
                      ],
                    ),
                    vertical30
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
