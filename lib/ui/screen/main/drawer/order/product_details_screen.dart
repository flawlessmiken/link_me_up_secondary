import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:provider/provider.dart';
import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../../constants/route_names.dart';

import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import 'add_payment_screen.dart';
import 'order_directory_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  get appPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Details',
            actions: [
              IconButton(
                  onPressed: () {
                    // userProv.addItemCart(id, quantity)
                  },
                  icon: Icon(
                    Icons.add_shopping_cart,
                    color: Colors.black,
                  )),
            ],
          ),
          ResponsiveState(
            state: userProv.state,
            busyWidget: Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
            ),
            idleWidget: Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserImageIcon(
                        imageUrl: "${userProv.productDetailsModel.data?.image}",
                        radius: SizeConfig.heightOf(50),
                        isCircular: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "${userProv.productDetailsModel.data?.longName}",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
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
                        'Amount: ${userProv.productDetailsModel.data?.price}',
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
          ),
        ],
      ),
    );
  }
}
