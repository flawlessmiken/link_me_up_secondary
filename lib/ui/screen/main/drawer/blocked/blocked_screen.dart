import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';
import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';

class BlockedScreen extends StatelessWidget {
  BlockedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Blocked',
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ))
            ],
          ),
          ResponsiveState(
            state: userProv.state,
            busyWidget: const Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
            ),
            idleWidget: Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView.builder(
                      itemCount: userProv.blockedUserModel.data?.length,
                      itemBuilder: ((context, index) {
                        var blocked =
                            userProv.blockedUserModel.data?.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                title: "Unblock user",
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
                                      "Are you sure you want to unblock user?",
                                      textAlign: TextAlign.center,
                                      style: txStyle14.copyWith(height: 1.5),
                                    )
                                  ],
                                ),
                                confirm: InkWell(
                                  onTap: () async {
                                    bool u = await userProv
                                        .unblockAUser(blocked!.id!);
                                    if (u) {
                                      userProv.getBlockedUsers();
                                      Get.close(1);
                                    }
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
                                      border:
                                          Border.all(color: appPrimaryColor),
                                      borderRadius: BorderRadius.circular(6),
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
                            child: ListTile(
                              leading: UserImageIcon(
                                imageUrl: "${blocked?.profilePicture}",
                              ),
                              title: Text(
                                  capitalizeFirstText(
                                      "${blocked?.firstName} ${blocked?.lastName}"),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  )),
                              subtitle: Text("@${blocked?.nameTag}",
                                  style:
                                      txStyle12.copyWith(color: Colors.grey)),
                              trailing: Text("${blocked?.type}",
                                  style:
                                      txStyle12.copyWith(color: Colors.grey)),
                            ),
                          ),
                        );
                      })),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
