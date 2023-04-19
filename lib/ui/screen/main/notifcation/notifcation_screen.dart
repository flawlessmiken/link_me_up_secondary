import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/notifcation/notification_details_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../api/core/repositories/user_repository.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final userProv = Provider.of<UserRepository>(context, listen: false);
      userProv.toggleNotificationView();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: ResponsiveState(
        state: userProv.state,
        busyWidget: const Center(
          child: CircularProgressIndicator(
            color: appPrimaryColor,
          ),
        ),
        idleWidget: Column(
          children: [
            CustomAppBar(
              title: "Notifications",
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            Expanded(
              child: RefreshIndicator(
                color: appPrimaryColor,
                onRefresh: () async {
                  final userProv =
                      Provider.of<UserRepository>(context, listen: false);
                  userProv.fetchNotification();
                },
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: userProv.notificationModel.data?.length,
                        itemBuilder: (context, index) {
                          var notification =
                              userProv.notificationModel.data?.elementAt(index);
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: InkWell(
                              onTap: () {
                                userProv.fetchNotificationDetails(
                                    notification!.id!);
                                Get.to(NotificationDetailsScreen());
                              },
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: UserImageIcon(
                                    imageUrl: "${notification?.picture}"),
                                title: Text(
                                  capitalizeFirstText("${notification?.title}"),
                                  style: txStyle14.copyWith(
                                      fontWeight: notification!.read!
                                          ? FontWeight.w400
                                          : FontWeight.w600),
                                ),
                                subtitle: Text(
                                    toBeginningOfSentenceCase(
                                        "${notification.description}")!,
                                    style: txStyle12),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      DateFormat.MMMMd().format(
                                          notification.createdAt ??
                                              DateTime.now()),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    vertical10,
                                    notification.read!
                                        ? SizedBox.shrink()
                                        : Container(
                                            height: 8,
                                            width: 8,
                                            decoration: BoxDecoration(
                                                color: appPrimaryColor,
                                                shape: BoxShape.circle),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
