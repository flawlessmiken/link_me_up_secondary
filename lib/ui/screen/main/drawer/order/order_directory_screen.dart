import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:provider/provider.dart';

import '../../../../../api/repositories/user_repository.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/utils.dart';
import 'cart_screen.dart';
import 'checkout.dart';

class OrderDirectoryScreen extends StatefulWidget {
  const OrderDirectoryScreen({Key? key}) : super(key: key);

  @override
  State<OrderDirectoryScreen> createState() => _OrderDirectoryScreenState();
}

class _OrderDirectoryScreenState extends State<OrderDirectoryScreen> {
  bool selectAll = false;

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Directory',
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        )),
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SortSheet());
                  },
                  icon: Icon(Icons.sort))
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox.shrink(),
                        Text(
                          "1 of 1",
                          style: txStyle12,
                        ),
                        Row(
                          children: [
                            Text(
                              "All",
                              style: txStyle14,
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              activeColor: Theme.of(context).primaryColor,
                              value: selectAll,
                              onChanged: (bool? value) {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child:
                      userProv.directoryModel.data?.isEmpty ?? true ?
                      Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                vertical30,
                                SvgPicture.asset(
                                    "assets/svg_icon/empty_contact.svg"),
                                const Text(
                                  "Your directory is empty",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                ),
                              ],
                            ):
                       ListView.builder(
                          shrinkWrap: true,
                          itemCount: userProv.directoryModel.data?.length,
                          itemBuilder: ((context, index) {
                            var directory =
                                userProv.directoryModel.data?.elementAt(index);
                            return InkWell(
                              onTap: () {
                                userProv.addUserToSelectedUser(index);
                              },
                              child: ListTile(
                                leading: UserImageIcon(
                                    imageUrl: "${directory?.profilePicture}"),
                                title: Text(
                                    capitalizeFirstText(
                                        "${directory?.firstName} ${directory?.lastName}"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                                subtitle: Text('@${directory?.nameTag}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                                trailing: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: appPrimaryColor, width: 1)),
                                  child: Center(
                                      child: userProv.selectedUserList
                                              .contains(index)
                                          ? Icon(
                                              Icons.done,
                                              size: 15,
                                            )
                                          : SizedBox.shrink()),
                                ),
                              ),
                            );
                          })),
                    ),
                    vertical30,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthOf(4)),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                            backgroundColor: Colors.white,
                            borderColor: appPrimaryColor,
                            textColor: appPrimaryColor,
                            onPressed: () async {
                              bool u = await userProv.addItemCart(
                                  "${userProv.productDetailsModel.data?.id}",
                                  10);

                              if (u) {
                                Get.defaultDialog(
                                  title: "Add to cart",
                                  titlePadding: EdgeInsets.only(top: 20),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 20),
                                  backgroundColor: Colors.white,
                                  titleStyle: txStyle20,
                                  barrierDismissible: true,
                                  radius: 6,
                                  content: Column(
                                    children: [
                                      Text(
                                        "Item added to cart.",
                                        textAlign: TextAlign.center,
                                        style: txStyle14.copyWith(height: 1.5),
                                      )
                                    ],
                                  ),
                                  confirm: InkWell(
                                    onTap: () async {
                                      userProv.getCartItem();
                                      Get.off(
                                        CartScreen(),
                                        transition: Transition.rightToLeft,
                                      );
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        color: appPrimaryColor,
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "View cart",
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
                                        border:
                                            Border.all(color: appPrimaryColor),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                          child: Text(
                                        "Ok",
                                        style: txStyle14,
                                      )),
                                    ),
                                  ),
                                );
                              }
                            },
                            text: "Add to cart",
                          )),
                        ],
                      ),
                    ),
                    vertical20,
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthOf(4)),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                            onPressed: () {
                              Get.to(CheckOutScreen());
                            },
                            text: "Proceed",
                          )),
                        ],
                      ),
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

class SortSheet extends StatefulWidget {
  const SortSheet({Key? key}) : super(key: key);

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4), vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: 30,
            color: Colors.black,
          ),
          vertical10,
          Text(
            "Filter",
            style: txStyle16,
          ),
          vertical30,
          Row(
            children: [
              SvgPicture.asset("assets/svg_icon/with_sticker.svg"),
              horizontalx10,
              Text(
                "With stickers",
                style: txStyle17,
              ),
            ],
          ),
          vertical20,
          Row(
            children: [
              SvgPicture.asset("assets/svg_icon/without_sticker.svg"),
              horizontalx10,
              Text(
                "Without sticker",
                style: txStyle17,
              ),
            ],
          ),
          vertical30
        ],
      ),
    );
  }
}
