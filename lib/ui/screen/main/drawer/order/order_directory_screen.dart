import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';

import '../../../../widgets/app_bar.dart';
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
          Expanded(
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
                            onChanged: (bool? value) {
                              setState(() {
                                selectAll = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(StaffInformation());
                            },
                            child: ListTile(
                              leading: UserImageIcon(
                                  imageUrl:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgyzAT-K4vq9i94N0B5_N2RJteGwxzZTQWcQ&usqp=CAU"),
                              title: Text('Nonso Godfrey',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              subtitle: Text('@NonsoGodfrey',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  )),
                              trailing: Checkbox(
                                checkColor: Colors.white,
                                activeColor: Theme.of(context).primaryColor,
                                value: selectAll,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectAll = value!;
                                  });
                                },
                              ),
                            ),
                          );
                        })),
                  ),
                  vertical30,
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
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
