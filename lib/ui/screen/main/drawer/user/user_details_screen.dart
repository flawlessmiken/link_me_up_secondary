import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/user/edit_user_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../widgets/app_bar.dart';

class UserDetailsScreen extends StatefulWidget {
  final String userId;
  const UserDetailsScreen({Key? key, required this.userId}) : super(key: key);

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Users Profile',
          ),
          ResponsiveState(
            state: userProv.state,
            busyWidget: Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
            ),
            idleWidget: Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
                child: Column(
                  children: [
                    UserImageIcon(
                      imageUrl:
                          "${userProv.userDetailsModel.data?.profilePicture}",
                      radius: 120,
                    ),
                    vertical30,
                    SmallCustomTextField(
                      labelText: "Full name",
                      hintText: capitalizeFirstText(
                          "${userProv.userDetailsModel.data?.firstName}"
                          " ${userProv.userDetailsModel.data?.lastName}"),
                      readOnly: true,
                    ),
                    SmallCustomTextField(
                      labelText: "Username",
                      hintText: "${userProv.userDetailsModel.data?.email}",
                      readOnly: true,
                    ),
                    SmallCustomTextField(
                      labelText: "Role",
                      hintText: "${userProv.userDetailsModel.data?.role}",
                      readOnly: true,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {},
                            text: "View entry list",
                            borderColor: appPrimaryColor,
                            textColor: Colors.black,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    vertical20,
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              Get.to(EditUserScreen());
                            },
                            text: "Edit",
                            borderColor: appPrimaryColor,
                            textColor: Colors.white,
                            backgroundColor: appPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    vertical30
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
