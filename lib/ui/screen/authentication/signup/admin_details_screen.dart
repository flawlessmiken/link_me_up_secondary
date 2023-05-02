import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/userpin_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:provider/provider.dart';

import '../../../../api/repositories/auth_repository.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/phone_number_input.dart';

class AdminRegistration extends StatefulWidget {
  const AdminRegistration({Key? key}) : super(key: key);

  @override
  State<AdminRegistration> createState() => _AdminRegistrationState();
}

class _AdminRegistrationState extends State<AdminRegistration> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  PhoneController phoneNumber = PhoneController(null);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  File? file;
  String? _filePath;
  final _key = GlobalKey<FormState>();
  String _selectedCountry = 'Nigeria';
  List<String>? countriesListfromParse;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initializeValues();
    });
  }

  initializeValues() async {
    Provider.of<AuthRepository>(context, listen: false).getCountries();
  }

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);

    return Scaffold(
      body: Form(
        key: _key,
        child: Column(
          children: [
            CustomAppBar(
              title: 'Enter admin details',
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              height: 74,
                              width: 74,
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade100,
                                shape: BoxShape.circle,
                                // image: DecorationImage(image: AssetImage('assets/images/profilepics.png',),fit: BoxFit.scaleDown )
                              ),
                              child: Center(
                                  child: file == null
                                      ? Image.asset(
                                          'assets/images/profilepics.png',
                                          height: 30,
                                          width: 30,
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
                                    height: 20,
                                    width: 20,
                                    decoration: const BoxDecoration(
                                        color: appPrimaryColor,
                                        shape: BoxShape.circle),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      color: Colors.white,
                                      size: 15,
                                    )),
                              ))
                        ],
                      ),
                      vertical10,
                      const Text(
                        'Complete this process\nget started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff626262)),
                      ),
                      vertical20,
                      // Center(
                      //   child: InkWell(
                      //       // onTap: () async {
                      //       //   FilePickerResult result = await FilePicker.platform
                      //       //       .pickFiles(type: FileType.image);
                      //       //   if (result != null) {
                      //       //     file = File(result.files.single.path);
                      //       //     _filePath = result.files.single.path;

                      //       //     setState(() {});
                      //       //   } else {
                      //       //     // User canceled the picker
                      //       //   }
                      //       // },
                      //       child: file == null
                      //           ? Text(
                      //               "Tap to add image",
                      //               style: TextStyle(
                      //                   color: Colors.black, fontSize: 12),
                      //             )
                      //           : Text(
                      //               "Tap to change image",
                      //               style: TextStyle(
                      //                   color: Colors.black, fontSize: 12),
                      //             )),
                      // ),
                      CustomTextField(
                        labelText: 'First Name',
                        controller: firstNameController,
                        validator: (value) => authProv.validateName(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),

                      vertical10,
                      CustomTextField(
                        labelText: 'Last Name',
                        controller: lastNameController,
                        validator: (value) => authProv.validateName(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (value) => authProv.validateEmail(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      vertical10,
                      CustomTextField(
                        labelText: 'Password',
                        obscureText: true,
                        controller: passwordController,
                        validator: (value) => authProv.validatePassword(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      vertical10,
                      CustomTextField(
                        labelText: 'Confirm Password',
                        controller: confirmController,
                        obscureText: true,
                        validator: (value) => authProv.confirmPassword(value!),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ResponsiveState(
                        state: authProv.state,
                        busyWidget: Center(
                          child:
                              CircularProgressIndicator(color: appPrimaryColor),
                        ),
                        idleWidget: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Expanded(
                                  child: CustomButton(
                                text: 'Next',
                                onPressed: () async {
                                  if (!_key.currentState!.validate()) return;
                                  var pNumber =
                                      '${phoneNumber.value?.countryCode}${phoneNumber.value?.nsn}';
                                  bool res = await authProv.createAdminDetails(
                                      firstNameController.text,
                                      lastNameController.text,
                                      pNumber,
                                      emailController.text,
                                      passwordController.text,
                                      _filePath!);
                                  if (res) {
                                    Get.to(UserPin(
                                      email: emailController.text,
                                    ));
                                  }
                                },
                              ))
                            ],
                          ),
                        ),
                      ),
                      vertical50
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
