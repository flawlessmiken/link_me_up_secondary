import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/models/user_details_model.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';

import 'package:provider/provider.dart';
import '../../../../../api/models/user_roles_model.dart';
import '../../../../../api/repositories/user_repository.dart';
import '../../../../../constants/colors.dart';
import '../../../../responsive_state/responsive_state.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_dropdown.dart';
import '../../../../widgets/custom_textfield.dart';

class EditUserScreen extends StatefulWidget {
  final UserDetailsModel userDetailsModel;
  const EditUserScreen({Key? key, required this.userDetailsModel})
      : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  List<String> roles = [];
  String selectedRole = "";
  var firstName = TextEditingController();
  var lastName = TextEditingController();

  final _key = GlobalKey<FormState>();

  // AddNewUserModel NewUser = AddNewUserModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getUserRoles();
    });
    setState(() {
      firstName.text =
          capitalizeFirstText("${widget.userDetailsModel.data?.firstName}");
      lastName.text =
          capitalizeFirstText("${widget.userDetailsModel.data?.lastName}");

      selectedRole = widget.userDetailsModel.data!.role!;
    });
  }

  List<String> getUserRoles() {
    final userProv = Provider.of<UserRepository>(context, listen: false);
    UserRoles userRolesResponse = userProv.userRoles;
    roles.clear();
    for (var i = 0; i < userProv.userRoles.data!.length; i++) {
      roles.insert(0, userProv.userRoles.data!.elementAt(i));
    }
    roles.add("Select from the list below");
    log("${roles}");
    return roles;
  }

  File? file;
  String _filePath = "";
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'User details',
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: SizeConfig.widthOf(4)),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles();
                        if (result != null) {
                          file = File(result.files.single.path!);
                          _filePath = result.files.single.path!;

                          setState(() {});
                        } else {
                          // User canceled the picker
                        }
                      },
                      child: Center(
                        child: Stack(
                          children: [
                            file == null
                                ? UserImageIcon(
                                    imageUrl:
                                        "${widget.userDetailsModel.data?.profilePicture}",
                                    radius: 100,
                                  )
                                : Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.lightBlue.shade100,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: FileImage(
                                              file!,
                                            ),
                                            fit: BoxFit.cover)),
                                  ),
                            Positioned(
                                right: 0,
                                bottom: 0,
                                child: InkWell(
                                  onTap: () async {
                                    FilePickerResult? result =
                                        await FilePicker.platform.pickFiles();
                                    if (result != null) {
                                      file = File(result.files.single.path!);
                                      _filePath = result.files.single.path!;

                                      setState(() {});
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                          color: appPrimaryColor,
                                          shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.camera_alt,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                ))
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      labelText: 'First name',
                      hintText: 'John',
                      controller: firstName,
                    ),
                    vertical10,
                    CustomTextField(
                      labelText: 'Last name',
                      hintText: 'Doe',
                      controller: lastName,
                    ),
                    vertical10,
                    CustomDropdown(
                      dropdownItem: getUserRoles(),
                      selectedValue: selectedRole,
                      onChanged: (option) {
                        setState(() {
                          selectedRole = option!;
                        });
                      },
                      labelText: "Position",
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ResponsiveState(
                      state: user.state,
                      busyWidget: Center(
                          child: CircularProgressIndicator(
                        color: appPrimaryColor,
                      )),
                      idleWidget: Row(
                        children: [
                          Expanded(
                            child: CustomButton(
                              onPressed: () async {
                                bool u = await user.editUserProfile(
                                    firstName.text,
                                    lastName.text,
                                    "${widget.userDetailsModel.data?.phoneNumber}",
                                    "${widget.userDetailsModel.data?.email}",
                                    _filePath,
                                    selectedRole,
                                    "${widget.userDetailsModel.data?.id}");

                                if (u) {
                                  Get.back();
                                }
                                //   NewUser.role = selectedRole;

                                //   Navigator.push(
                                //       context,
                                //       MaterialPageRoute(
                                //           builder: (context) => AddUserProfileScreen(
                                //                 file: file,
                                //               )));
                                // }
                                //Navigator.pushNamed(context, RouteNames.verifyScreen);
                              },
                              text: 'Save changes',
                              backgroundColor: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
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
