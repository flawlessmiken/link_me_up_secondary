import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/businessCard.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/counterTops.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/identityCard.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/sticker.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import '../../../../widgets/app_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      CustomAppBar(
        title: 'Order',
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.shopping_cart_checkout)),
        ],
      ),
      Expanded(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
        child: SingleChildScrollView(
            child: Column(children: [
          vertical30,
          InkWell(
            onTap: () {
              Get.to(BusinessCard());

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Business Card',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.to(IdentityCard());

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Identity card',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.to(Stickers());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stickers',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              Get.to(CounterTop());

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Counter tops',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ])),
      ))
    ]));
  }
}
