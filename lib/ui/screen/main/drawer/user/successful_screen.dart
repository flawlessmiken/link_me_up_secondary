import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_dropdown.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:provider/provider.dart';
import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../../constants/route_names.dart';
import '../../../../mixin/responsive_state/responsive_state.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/phone_number_input.dart';

class SuccessfulScreen extends StatefulWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  State<SuccessfulScreen> createState() => _SuccessfulScreenState();
}

class _SuccessfulScreenState extends State<SuccessfulScreen> {
  // AddNewUserModel NewUser = AddNewUserModel();

  File? file;
  String? _filePath;
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Add user',
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
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: SizeConfig.widthOf(4)),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    children: [
                      Center(
                        child: UserImageIcon(
                            radius: 120,
                            imageUrl:
                                "${userProv.successfullAddedUserModel.data?.profilePicture}"),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SmallCustomTextField(
                        labelText: 'First name',
                        hintText: capitalizeFirstText(
                            "${userProv.successfullAddedUserModel.data?.firstName}"),
                      ),
                      vertical10,
                      SmallCustomTextField(
                          labelText: 'Last name',
                          hintText: capitalizeFirstText(
                            "${userProv.successfullAddedUserModel.data?.lastName}",
                          )),
                      vertical10,
                      SmallCustomTextField(
                        labelText: 'Phone number',
                        hintText:
                            "${userProv.successfullAddedUserModel.data?.phoneNumber}",
                      ),
                      vertical10,
                      SmallCustomTextField(
                        labelText: 'Role',
                        hintText:
                            "${userProv.successfullAddedUserModel.data?.role}",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () async {},
                              text: 'Share',
                              backgroundColor: appPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      vertical20,
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              borderColor: appPrimaryColor,
                              onPressed: () async {
                                userProv.fetchAllUser();
                                Get.close(1);
                              },
                              text: 'Done',
                              backgroundColor: Colors.white,
                              textColor: appPrimaryColor,
                            ),
                          ),
                        ],
                      ),
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
