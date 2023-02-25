import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/payment_successful_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';

import '../../../../widgets/credit_card.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_switch.dart';

class AddPaymentDetails extends StatefulWidget {
  const AddPaymentDetails({Key? key}) : super(key: key);

  @override
  State<AddPaymentDetails> createState() => _AddPaymentDetailsState();
}

class _AddPaymentDetailsState extends State<AddPaymentDetails> {
  final cardHolderName = TextEditingController();
  final cardNumber = TextEditingController();
  final cvv = TextEditingController();
  final expiryMonth = TextEditingController();
  final addCardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Payment details"),
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
              child: Column(
                children: [
                  AddNewCardScreen(
                    cardHolderName: cardHolderName,
                    cardNumber: cardNumber,
                    cvv: cvv,
                    expiryDate: expiryMonth,
                  ),
                  vertical20,
                  SwitchButtonWidget(
                      title: "Save for future transaction",
                      onChanged: (value) {}),
                  vertical10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: txStyle16,
                      ),
                      Text(
                        "Total",
                        style: txStyle16.copyWith(color: Colors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
            child: Row(
              children: [
                Expanded(
                    child: CustomButton(
                  onPressed: () {
                    Get.to(PaymentSuccessfulScreen());
                  },
                  text: 'Pay Now',
                  textColor: Colors.white,
                  backgroundColor: appPrimaryColor,
                  borderColor: appPrimaryColor,
                ))
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
            child: Row(
              children: [
                Expanded(
                    child: CustomButton(
                  backgroundColor: Color(0xffF30101),
                  borderColor: Color(0xffF30101),
                  text: 'Cancel',
                  onPressed: () {
                    // Get.to(AddPaymentDetails());
                  },
                ))
              ],
            ),
          ),
          vertical30
        ],
      ),
    );
  }
}
