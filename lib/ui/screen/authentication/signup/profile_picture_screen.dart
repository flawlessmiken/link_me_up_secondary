// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/completation_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';


import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../mixin/responsive_state/responsive_state.dart';
import '../../../size_config/size_config.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';

class ProfilePicture extends StatefulWidget {
  final String? category;
  final String? name;
  final String? nameController;
  final String? addressController;
  final String? postalCodeController;
  final String? websiteController;
  final String? businessEmailController;
  final String? businessPhoneController;
  const ProfilePicture({
    Key ?key,
    this.category,
    this.name,
    this.nameController,
    this.addressController,
    this.postalCodeController,
    this.websiteController,
    this.businessEmailController,
    this.businessPhoneController,
  }) : super(key: key);

  @override
  State<ProfilePicture> createState() => _ProfilePictureState();
}

class _ProfilePictureState extends State<ProfilePicture> {
  final _key = GlobalKey<FormState>();

  File? file;
  String ?_filePath;
  final TextEditingController nameTag = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<AuthRepository>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      
      body: Column(
        children: [
           CustomAppBar(
        title: 'Add Picture & Tag Name',
      ),
          Expanded(
            child: Form(
              key: _key,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthOf(5)),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                            width: SizeConfig.screenWidth / 1.3,
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text: 'Hi ${widget.name}',
                                style: txStyle16.copyWith(color: appPrimaryColor),
                                children: <TextSpan>[
                                  TextSpan(
                                    text:
                                        ' add your picture and Choose your unique name tag for identifying yourself',
                                    style: txStyle16,
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: SizeConfig.heightOf(8),
                        ),
                        Container(
                          height: 145,
                          width: 145,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade100,
                            shape: BoxShape.circle,
                            // image: DecorationImage(image: AssetImage('assets/images/profilepics.png',),fit: BoxFit.scaleDown )
                          ),
                          child: Stack(
                            children: [
                              Center(
                                  child: file == null
                                      ? Image.asset(
                                          'assets/images/profilepics.png',
                                          height: 84,
                                          width: 90,
                                        )
                                      : Container(
                                          height: 145,
                                          width: 145,
                                          decoration: BoxDecoration(
                                              color: Colors.lightBlue.shade100,
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: FileImage(
                                                    file!,
                                                  ),
                                                  fit: BoxFit.cover)),
                                        )),
                              Positioned(
                                  right: 0,
                                  bottom: 10,
                                  child: InkWell(
                                    onTap: () async {
                                      FilePickerResult ?result =
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
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).primaryColor,
                                            shape: BoxShape.circle),
                                        child: const Icon(Icons.camera_alt,
                                            color: Colors.white)),
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.heightOf(8),
                        ),
                        CustomTextField(
                          labelText: 'Enter your name tag',
                          // hasLeading: true,
                          controller: nameTag,
                          validator: (value) => model.validateName(value!),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        vertical30,
                        ResponsiveState(
                          state: model.state,
                          busyWidget: const SizedBox(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(strokeWidth: 6)),
                          idleWidget: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  onPressed: () async {
                                    // SharedPreferences prefs =
                                    //     await SharedPreferences.getInstance();
                                    // String adminId = prefs.getString('adminId');
                                    // if (!_key.currentState.validate()) return;
                
                                    // print(_filePath);
                                    // bool u = await model.completeRegistration(
                                    //   SecondaryCategoryName: widget.name,
                                    //   SecondaryCategoryPicture: _filePath,
                                    //   SecondaryCategoryNameTag: nameTag.text,
                                    //   SecondaryCategoryType: widget.category,
                                    //   SecondaryCategoryPostalCode:
                                    //       widget.postalCodeController,
                                    //   SecondaryCategoryAddress:
                                    //       widget.addressController,
                                    //   SecondaryCategoryWebsite:
                                    //       widget.websiteController,
                                    //   SecondaryCategoryEmailAddress:
                                    //       widget.businessEmailController,
                                    //   SecondaryCategoryPhoneNumber:
                                    //       widget.businessPhoneController,
                                    //   AdminId: adminId,
                                    //   // email: widget.businessEmailController,
                                    //   // phoneNumber:
                                    //   //     widget.businessPhoneController
                                    // );
                                    // if (u) {
                                    //   Navigator.push(
                                    //       context,
                                    //       MaterialPageRoute(
                                    //           builder: (context) =>
                                    //               CompletionScreen()));
                                    // }
                                    //Navigator.pushNamed(context, RouteNames.verifyScreen);
                                    Get.to(CompletionScreen());
                                  },
                                  text: 'Proceed',
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
          ),
        ],
      ),
    );
  }
}
