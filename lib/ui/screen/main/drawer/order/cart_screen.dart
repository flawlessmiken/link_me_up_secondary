import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/repositories/user_repository.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? selectedRadio;

  setSelectedRadio(val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: "Cart",
          ),
          ResponsiveState(
            state: userProv.state,
            busyWidget: Center(
              child: CircularProgressIndicator(color: appPrimaryColor),
            ),
            idleWidget: Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: userProv.cartItemModel.data?.items?.isEmpty ?? true
                      ? Column(
                          children: [
                            SvgPicture.asset(
                                "assets/svg_icon/empty_screen_state.svg"),
                            Text(
                              "You are yet to add an item to cart!",
                              style: txStyle14,
                            )
                          ],
                        )
                      : ListView.builder(
                          itemCount:
                              userProv.cartItemModel.data?.items?.length ?? 0,
                          itemBuilder: (context, index) {
                            var items = userProv.cartItemModel.data?.items
                                ?.elementAt(index)
                                .productId;
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    UserImageIcon(
                                      imageUrl: "${items?.image}",
                                      isCircular: false,
                                      radius: 100,
                                    ),
                                    horizontalx10,
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Descitpion: ",
                                              style: txStyle12,
                                            ),
                                            Text(
                                              capitalizeFirstText(
                                                  "${items?.shortName}"),
                                              style: txStyle12,
                                            )
                                          ],
                                        ),
                                        vertical5,
                                        Row(
                                          children: [
                                            Text(
                                              "Amount: ",
                                              style: txStyle12,
                                            ),
                                            Text(
                                              convertStringToCurrency(
                                                  "${userProv.cartItemModel.data!.items!.elementAt(index).quantity!}"),
                                              style: txStyle12,
                                            )
                                          ],
                                        ),
                                        vertical5,
                                        Row(
                                          children: [
                                            Text(
                                              "Quantity: ",
                                              style: txStyle12,
                                            ),
                                            Text(
                                              capitalizeFirstText(
                                                  "${userProv.cartItemModel.data?.items?.elementAt(index).quantity}"),
                                              style: txStyle12,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            userProv
                                                .addItemToSelectedItem(index);
                                          },
                                          child: Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: appPrimaryColor,
                                                    width: 1)),
                                            child: Center(
                                                child: userProv.selectedItemList
                                                        .contains(index)
                                                    ? Icon(
                                                        Icons.done,
                                                        size: 10,
                                                      )
                                                    : SizedBox.shrink()),
                                          ),
                                        ),
                                        vertical20,
                                        InkWell(
                                          onTap: () async {
                                            Get.defaultDialog(
                                              title: "Remove Item",
                                              titlePadding:
                                                  EdgeInsets.only(top: 20),
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 20,
                                                      horizontal: 20),
                                              backgroundColor: Colors.white,
                                              titleStyle: txStyle20,
                                              barrierDismissible: true,
                                              radius: 6,
                                              content: Column(
                                                children: [
                                                  Text(
                                                    "Are you sure you want to remove item from cart?",
                                                    textAlign: TextAlign.center,
                                                    style: txStyle14.copyWith(
                                                        height: 1.5),
                                                  )
                                                ],
                                              ),
                                              confirm: InkWell(
                                                onTap: () async {
                                                  Get.close(1);

                                                  bool u = await userProv
                                                      .removeItemFromCart(
                                                          items!.id!);
                                                  if (u) {
                                                    userProv.getCartItem();
                                                  }
                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: appPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "Yes",
                                                    style: txStyle14wt,
                                                  )),
                                                ),
                                              ),
                                              cancel: InkWell(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                child: Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: appPrimaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "No",
                                                    style: txStyle14,
                                                  )),
                                                ),
                                              ),
                                            );
                                          },
                                          child: Icon(
                                            Icons.delete_forever_outlined,
                                            color: Colors.red,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                vertical5,
                                Divider()
                              ],
                            );
                          }),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
