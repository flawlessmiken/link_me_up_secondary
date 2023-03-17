import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/user/add_new_user_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/user/user_details_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../widgets/app_bar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final userProv = Provider.of<UserRepository>(context, listen: false);

      userProv.getUserRoles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Users',
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    userProv.getUserRoles();

                    Get.to(AddNewUserScreen());
                  },
                  icon: Icon(Icons.add))
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
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userProv.allUserModel.data?.length,
                          itemBuilder: ((context, index) {
                            return InkWell(
                              onTap: () {
                                userProv.getUserDetails(userProv
                                    .allUserModel.data!
                                    .elementAt(index)
                                    .id!);
                                Get.to(UserDetailsScreen(
                                  userId: userProv.allUserModel.data!
                                      .elementAt(index)
                                      .id!,
                                ));
                              },
                              child: ListTile(
                                leading: UserImageIcon(
                                    imageUrl:
                                        "${userProv.allUserModel.data?.elementAt(index).profilePicture}"),
                                title: Text(
                                    capitalizeFirstText(
                                        "${userProv.allUserModel.data?.elementAt(index).firstName}"
                                        " ${userProv.allUserModel.data?.elementAt(index).lastName}"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                                subtitle: Text('@NonsoGodfrey',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                                trailing: Text(
                                    "${userProv.allUserModel.data?.elementAt(index).role}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                              ),
                            );
                          })),
                    ),
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
