import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';

class PaymentSuccessfulScreen extends StatefulWidget {
  const PaymentSuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessfulScreen> createState() => _PaymentSuccessfulScreenState();
}

class _PaymentSuccessfulScreenState extends State<PaymentSuccessfulScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4), vertical: 20),
          child: Column(
            children: [
              Text(
                "Linkmeup Security",
                style: txStyle16.copyWith(color: appPrimaryColor),
              ),
              Spacer(),
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: appPrimaryColor)),
                child: Center(
                  child: Icon(
                    Icons.done,
                    color: appPrimaryColor,
                    size: 40,
                  ),
                ),
              ),
              vertical20,
              Text(
                "Payment Successful",
                style: txStyle16,
              ),
              Spacer(),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                        onPressed: () {},
                    text: "Close",
                    textColor: appPrimaryColor,
                    borderColor: appPrimaryColor,
                    backgroundColor: Colors.white,
                  )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
