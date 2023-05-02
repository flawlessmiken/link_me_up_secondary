import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/cart_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:provider/provider.dart';
import '../../../../../api/repositories/user_repository.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/route_names.dart';

import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import 'add_payment_screen.dart';
import 'order_directory_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Details',
            // actions: [
            //   IconButton(
            //       onPressed: () async {
            //         bool u = await userProv.addItemCart(
            //             "${userProv.productDetailsModel.data?.id}", 10);

            //         if (u) {
            //           Get.defaultDialog(
            //             title: "Add to cart",
            //             titlePadding: EdgeInsets.only(top: 20),
            //             contentPadding:
            //                 EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            //             backgroundColor: Colors.white,
            //             titleStyle: txStyle20,
            //             barrierDismissible: true,
            //             radius: 6,
            //             content: Column(
            //               children: [
            //                 Text(
            //                   "Item added to cart.",
            //                   textAlign: TextAlign.center,
            //                   style: txStyle14.copyWith(height: 1.5),
            //                 )
            //               ],
            //             ),
            //             confirm: InkWell(
            //               onTap: () async {
            //                 userProv.getCartItem();
            //                 Get.off(
            //                   CartScreen(),
            //                   transition: Transition.rightToLeft,
            //                 );
            //               },
            //               child: Container(
            //                 height: 35,
            //                 width: 100,
            //                 decoration: BoxDecoration(
            //                   color: appPrimaryColor,
            //                   borderRadius: BorderRadius.circular(6),
            //                 ),
            //                 child: Center(
            //                     child: Text(
            //                   "View cart",
            //                   style: txStyle14wt,
            //                 )),
            //               ),
            //             ),
            //             cancel: InkWell(
            //               onTap: () {
            //                 Get.back();
            //               },
            //               child: Container(
            //                 height: 35,
            //                 width: 100,
            //                 decoration: BoxDecoration(
            //                   color: Colors.white,
            //                   border: Border.all(color: appPrimaryColor),
            //                   borderRadius: BorderRadius.circular(6),
            //                 ),
            //                 child: Center(
            //                     child: Text(
            //                   "Ok",
            //                   style: txStyle14,
            //                 )),
            //               ),
            //             ),
            //           );
            //         }
            //       },
            //       icon: Icon(
            //         Icons.add_shopping_cart,
            //         color: Colors.black,
            //       )),
            // ],
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
                        'Quantity : ${userProv.productDetailsModel.data?.countInStock} peices',
                        style: txStyle16,
                      ),
                      Text(
                        'Amount: \$${userProv.productDetailsModel.data?.price}',
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
                                userProv.getDirectory();
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
