import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/api/core/models/user_roles_model.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/user/successful_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_dropdown.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:provider/provider.dart';
import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../../constants/route_names.dart';
import '../../../../mixin/responsive_state/responsive_state.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/phone_number_input.dart';

class AddNewUserScreen extends StatefulWidget {
  const AddNewUserScreen({Key? key}) : super(key: key);

  @override
  State<AddNewUserScreen> createState() => _AddNewUserScreenState();
}

class _AddNewUserScreenState extends State<AddNewUserScreen> {
  String selectedRole = "Admin";
  List<String> roles = [];

  var userName = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  // var phoneNumber = TextEditingController();
  PhoneController phoneNumber = PhoneController(null);

  var email = TextEditingController();
  var password = TextEditingController();

  final _key = GlobalKey<FormState>();

  // AddNewUserModel NewUser = AddNewUserModel();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      getUserRoles();
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
  String? _filePath;
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(
            title: 'Add user',
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
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: SizeConfig.widthOf(4)),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView(
                    children: [
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,
                                shape: BoxShape.circle,
                                // image: DecorationImage(image: AssetImage('assets/images/profilepics.png',),fit: BoxFit.scaleDown )
                              ),
                              child: Center(
                                  child: file == null
                                      ? Image.asset(
                                          'assets/images/profilepics.png',
                                          height: 50,
                                          width: 50,
                                        )
                                      : Container(
                                          height: 120,
                                          width: 120,
                                          decoration: BoxDecoration(
                                              color: Colors.lightBlue.shade100,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    file!,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        )),
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
                                      _filePath = result.files.single.path;
                                      log("$_filePath");

                                      setState(() {});
                                    } else {
                                      // User canceled the picker
                                    }
                                  },
                                  child: Container(
                                      height: 40,
                                      width: 40,
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
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: PhoneNumberInput(
                          controller: phoneNumber,
                        ),
                      ),
                      vertical10,
                      CustomTextField(
                        labelText: 'Email',
                        hintText: 'JohnDoe@gmail.com',
                        controller: email,
                      ),
                      vertical10,
                      CustomTextField(
                        labelText: 'Password',
                        hintText: '*******',
                        controller: password,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomDropdown(
                        dropdownItem: getUserRoles(),
                        selectedValue: selectedRole,
                        onChanged: (option) {
                          setState(() {
                            selectedRole = option!;
                          });
                        },
                        labelText: "Select user role",
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ResponsiveState(
                        state: userProv.state,
                        busyWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(
                                  color: appPrimaryColor,
                                )),
                          ],
                        ),
                        idleWidget: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () async {
                                  var pNumber =
                                      '${phoneNumber.value?.countryCode}${phoneNumber.value?.nsn}';
                                  bool u = await userProv.addNewUser(
                                      firstName.text,
                                      lastName.text,
                                      pNumber,
                                      email.text,
                                      password.text,
                                      _filePath!,
                                      selectedRole);

                                  if (u) {
                                    Get.off(SuccessfulScreen());
                                  }
                                },
                                text: 'Add User',
                                backgroundColor: appPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      vertical20,
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
