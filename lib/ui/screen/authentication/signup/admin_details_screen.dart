import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/userpin_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
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
    final model = Provider.of<AuthRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Enter admin details',
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Text(
                      'Complete this process\nget started',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 20),
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
                    Center(
                      child: InkWell(
                          // onTap: () async {
                          //   FilePickerResult result = await FilePicker.platform
                          //       .pickFiles(type: FileType.image);
                          //   if (result != null) {
                          //     file = File(result.files.single.path);
                          //     _filePath = result.files.single.path;

                          //     setState(() {});
                          //   } else {
                          //     // User canceled the picker
                          //   }
                          // },
                          child: file == null
                              ? Text(
                                  "Tap to add image",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )
                              : Text(
                                  "Tap to change image",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )),
                    ),
                    CustomTextField(
                      labelText: 'First Name',
                      controller: firstNameController,
                      // validator: (value) => model.validateName(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    vertical10,
                    CustomTextField(
                      labelText: 'Last Name',
                      controller: lastNameController,
                      // validator: (value) => model.validateName(value),
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
                      // validator: (value) => model.validateEmail(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    vertical10,
                    CustomTextField(
                      labelText: 'Password',
                      obscureText: true,
                      controller: passwordController,
                      // validator: (value) => model.validatePassword(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    vertical10,
                    CustomTextField(
                      labelText: 'Confirm Password',
                      controller: confirmController,
                      obscureText: true,
                      // validator: (value) => model.validatePassword(value),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomButton(
                            text: 'Next',
                            onPressed: () {
                              // if (!_key.currentState.validate()) return;

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => UserPin(
                              //               image: _filePath,
                              //               FirstName: firstNameController.text,
                              //               LastName: lastNameController.text,
                              //               Email: emailController.text,
                              //               PhoneNumber: phoneNumbercontroller.text,
                              //               password: passwordController.text,
                              //               ConfrirmPassword: confirmController.text,
                              //             )));

                              Get.to(UserPin());
                            },
                          ))
                        ],
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
    );
  }
}
