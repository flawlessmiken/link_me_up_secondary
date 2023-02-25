import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/add_payment_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'CheckOut',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text('Order summary'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Description',
                          style: txStyle16,
                        ),
                        Text(
                          'Business Card',
                          style: txStyle16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Staff',
                          style: txStyle16,
                        ),
                        Text(
                          '100',
                          style: txStyle16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Quantity',
                          style: txStyle16,
                        ),
                        Text(
                          '20,000',
                          style: txStyle16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style: txStyle16,
                          ),
                          Text(
                            '\$1000.00',
                            style: txStyle16,
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping',
                          style: txStyle16,
                        ),
                        Text(
                          '\$50.00',
                          style: txStyle16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'VAT',
                          style: txStyle16,
                        ),
                        Text(
                          '\$5.00',
                          style: txStyle16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Center(child: Text('Total Amount', style: txStyle16)),
                    vertical10,
                    Center(
                        child: Text(
                      '\$2000.00',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'shipping to \Nonso Godfrey',
                          style: txStyle12,
                        ),
                        Text('08056552266', style: txStyle12),
                        Text('223, MTN building Ikoyi, Lagos',
                            style: txStyle12),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Change shipping address ? ',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ),

                    // Spacer(),
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
                  onPressed: () {},
                  text: 'Add to cart',
                  textColor: Theme.of(context).primaryColor,
                  backgroundColor: Colors.white,
                  borderColor: Theme.of(context).primaryColor,
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
                  text: 'Buy now',
                  onPressed: () {
                    Get.to(AddPaymentDetails());
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
