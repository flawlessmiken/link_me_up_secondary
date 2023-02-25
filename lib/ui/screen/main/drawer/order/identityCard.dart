import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import 'order_directory_screen.dart';

class IdentityCard extends StatelessWidget {
  const IdentityCard({Key? key}) : super(key: key);

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
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/identity_card.png',
                      height: 400,
                      width: double.infinity,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Linkmeup identity card',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    vertical20,
                    Text(
                      'Specification',
                      style:
                         txStyle14
                    ),
                    Text(
                      'Dimension: H2 * w4',
                      style:
                         txStyle14
                    ),
                    Text(
                      'Quantity : 200 peices',
                      style:
                         txStyle14
                    ),
                    Text(
                      'Amount: \$50.00',
                      style:
                         txStyle14
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
                    )
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
