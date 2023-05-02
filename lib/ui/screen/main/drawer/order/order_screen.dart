import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/cart_screen.dart';

import 'package:link_me_up_secondary/ui/screen/main/drawer/order/product_details_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/repositories/user_repository.dart';
import '../../../../widgets/app_bar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
        body: Column(children: [
      CustomAppBar(
        title: 'Order',
        actions: [
          IconButton(
              onPressed: () {
                userProv.getCartItem();
                Get.to(
                  CartScreen(),
                  transition: Transition.rightToLeft,
                  );
              },
              icon: Icon(Icons.shopping_cart_checkout)),
        ],
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthOf(5), vertical: 10),
        child: ResponsiveState(
          state: userProv.state,
          busyWidget: Center(
            child: CircularProgressIndicator(
              color: appPrimaryColor,
            ),
          ),
          idleWidget: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: userProv.allProductModel.data?.length,
                itemBuilder: (context, index) {
                  var product = userProv.allProductModel.data?.elementAt(index);
                  return InkWell(
                    onTap: () {
                      userProv.getProductDetails("${product?.id}");
                      Get.to(ProductDetailsScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          capitalizeFirstText("${product?.shortName}"),
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
                  );
                }),
          ),
        ),
      ),
    ]));
  }
}
