import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/repositories/user_repository.dart';
import '../../../../styles/text_styles.dart';
import '../../../../widgets/app_bar.dart';

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Directory',
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
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
                    userProv.directoryModel.data?.isEmpty ?? true
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              vertical30,
                              SvgPicture.asset(
                                  "assets/svg_icon/empty_directory.svg"),
                              Text(
                                "This folder is empty.",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15),
                              ),
                              Text(
                                "No Directories",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          )
                        : MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: userProv.directoryModel.data?.length,
                                itemBuilder: ((context, index) {
                                  var directory = userProv.directoryModel.data
                                      ?.elementAt(index);
                                  return InkWell(
                                    onTap: () {
                                      userProv
                                          .getDirectoryDetails(directory!.id!);
                                      Get.to(StaffInformation());
                                    },
                                    child: ListTile(
                                      leading: UserImageIcon(
                                          imageUrl:
                                              "${directory?.profilePicture}"),
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
                                      trailing: Text("${directory?.type}",
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
