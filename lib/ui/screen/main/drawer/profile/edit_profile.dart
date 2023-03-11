import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/view_state.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/colors.dart';
import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';

class EditProfile extends StatefulWidget {
  final String? ID;
  const EditProfile({
    Key? key,
    this.ID,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<EditProfile> {
  List<String> roles = [];
  String selectedRole = "";
  var userName = TextEditingController();
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var phoneNumber = TextEditingController();
  var email = TextEditingController();

  @override
  void initState() {
    Future.delayed(Duration.zero, () {});
    super.initState();
  }

  File? file;
  String? _filePath;

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserRepository>(context);
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Edit profile',
          ),
          ResponsiveState(
            state: ViewState.Idle,
            busyWidget: Center(
              child: const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(strokeWidth: 6)),
            ),
            idleWidget: Expanded(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                file = File(result.files.single.path!);
                                _filePath = result.files.single.path;

                                setState(() {});
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Container(
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
                                          height: 80,
                                          width: 80,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                          child: Text(
                        "@MTN",
                        style: txStyle12.copyWith(color: Colors.grey),
                      )),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "Category",
                        hintText: "Business",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "Name",
                        hintText: "MTN",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "Address",
                        hintText: "Plot 233, MTN PLAZA",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "Website",
                        hintText: "wwww.mtn.ng",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "Business Email Address",
                        hintText: "officialemail@mtn.com",
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        labelText: "Business Phone Number",
                        hintText: "+2349031129609",
                        readOnly: true,
                      ),
                      SizedBox(
                        height: SizeConfig.heightOf(2),
                      ),
                      ResponsiveState(
                        state: ViewState.Idle,
                        busyWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                             SizedBox(
                                height: 30,
                                width: 30,
                                child:
                                    CircularProgressIndicator(strokeWidth: 6)),
                          ],
                        ),
                        idleWidget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onPressed: () async {},
                                  text: 'Save changes',
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
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
