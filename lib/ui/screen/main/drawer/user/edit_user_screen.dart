import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';

import 'package:provider/provider.dart';
import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../mixin/responsive_state/responsive_state.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({Key? key}) : super(key: key);

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  List<String> roles = [];
  String selectedRole = "";
  var userName = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var phoneNumber = TextEditingController();

  var email = TextEditingController();
  var password = TextEditingController();

  final _key = GlobalKey<FormState>();

  // AddNewUserModel NewUser = AddNewUserModel();

  @override
  void initState() {
    super.initState();

    // getUserRoles();
  }

  // getUserRoles() async {
  //   final user = Provider.of<UserRepository>(context, listen: false);
  //   bool res = await user.gerUserRoles();
  //   if (res) {
  //     UserRoles userRolesResponse = user.userRolesResponse;
  //     roles = userRolesResponse.data.toList();
  //     roles.add("Select from the list below");
  //   }
  // }

  File? file;
  String? _filePath;
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'User details',
          ),
          ResponsiveState(
            state: user.state,
            busyWidget: const Center(
              child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(strokeWidth: 6)),
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
                        child: Container(
                          height: 145,
                          width: 145,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade100,
                            shape: BoxShape.circle,
                            // image: DecorationImage(image: AssetImage('assets/images/profilepics.png',),fit: BoxFit.scaleDown )
                          ),
                          child: Center(
                              child: file == null
                                  ? Image.asset(
                                      'assets/images/profilepics.png',
                                      height: 84,
                                      width: 90,
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
                                    )),
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
                      CustomTextField(
                        labelText: 'Last name',
                        hintText: 'Doe',
                        controller: lastName,
                      ),
                      // CustomTextField(
                      //   labelText: 'Phone number',
                      //   hintText: '09012345678',
                      //   controller: phoneNumber,
                      // ),
                      // CustomTextField(
                      //   labelText: 'Email',
                      //   hintText: 'JohnDoe@gmail.com',
                      //   controller: email,
                      // ),
                      // CustomTextField(
                      //   labelText: 'Password',
                      //   hintText: '*******',
                      //   controller: password,
                      //   obscureText: true,
                      // ),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      // CustomDropDown(
                      //   options: roles,
                      //   onChanged: (option) {
                      //     setState(() {
                      //       selectedRole = option;
                      //     });
                      //   },
                      //   width: double.infinity,
                      //   height: 56,
                      //   textStyle: TextStyle(
                      //     fontSize: 16,
                      //     color: Colors.black,
                      //   ),
                      //   hintText: 'Select user role',
                      //   icon: Icon(
                      //     Icons.arrow_drop_down_rounded,
                      //     color: Colors.black,
                      //     size: 30,
                      //   ),
                      //   fillColor: Colors.transparent,
                      //   elevation: 2,
                      //   margin: EdgeInsetsDirectional.fromSTEB(12, 4, 12, 4),
                      //   hidesUnderline: true,
                      //   initialOption: selectedRole,
                      // ),
                      const SizedBox(
                        height: 40,
                      ),
                      ResponsiveState(
                        state: user.state,
                        busyWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                                height: 30,
                                width: 30,
                                child:
                                    CircularProgressIndicator(strokeWidth: 6)),
                          ],
                        ),
                        idleWidget: Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () async {
                                  // bool u = await user.addNewUserWithRole(
                                  //     _filePath,
                                  //     firstName.text,
                                  //     lastName.text,
                                  //     email.text,
                                  //     password.text,
                                  //     selectedRole,
                                  //     phoneNumber.text);

                                  // if (u) {
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
          ),
        ],
      ),
    );
  }
}
