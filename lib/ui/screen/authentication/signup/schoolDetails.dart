// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/profile_picture_screen.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../styles/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/phone_number_input.dart';
import '../../../widgets/registration_drop_down.dart';

class CategoryType {
  static const String PRIMARYSCHOOL = 'Primary School';
  static const String SECONDARYSCHOOL = 'Secondary School';
  static const String TERTIARYSCHOOL = 'Tertiary School';
}

class School extends StatefulWidget {
  final TextEditingController? nameController;
  final TextEditingController? addressController;
  final TextEditingController? postalCodeController;
  final TextEditingController? websiteController;
  final TextEditingController? businessEmailController;
  final TextEditingController? businessPhoneController;
  final GlobalKey<FormState>? formKey;

  School({
    Key? key,
    this.formKey,
    this.nameController,
    this.addressController,
    this.postalCodeController,
    this.websiteController,
    this.businessEmailController,
    this.businessPhoneController,
  }) : super(key: key);

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  String selectedSchoolType = CategoryType.PRIMARYSCHOOL;

  PhoneController phoneNumber = PhoneController(null);

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);
    final _key = GlobalKey<FormState>();

    return Form(
      key: _key,
      child: Column(
        children: [
          CustomeDropdown(
            labelText: 'School type',
            // isDropdown: true,
            selectedValue: selectedSchoolType,
            onChanged: (String? newValue) {
              // ignore: void_checks
              setState(() {
                selectedSchoolType = newValue!;
                //studentDropdownOption = dropdownValue;
                print(selectedSchoolType);
              });
            },
            // buildUi: true,
            dropdownItem: const [
              CategoryType.PRIMARYSCHOOL,
              CategoryType.SECONDARYSCHOOL,
              CategoryType.TERTIARYSCHOOL,
              'Select from the list below'
            ],
          ),
          CustomTextField(
            labelText: 'School Name',
            controller: widget.nameController,
            validator: (value) => authProv.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,
          CustomTextField(
            labelText: 'School Address',
            controller: widget.addressController,
            validator: (value) => authProv.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,
          CustomTextField(
            labelText: 'Postal Code',
            controller: widget.postalCodeController,
            validator: (value) => authProv.validateZip(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isDate: true,
          ),
          vertical10,
          CustomTextField(
              controller: widget.websiteController,
              labelText: 'School Website',
              textInputType: TextInputType.url),
          vertical10,
          CustomTextField(
            labelText: 'School Email Address ',
            controller: widget.businessEmailController,
            validator: (value) => authProv.validateEmail(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textInputType: TextInputType.emailAddress,
          ),
          vertical10,
          Container(
            margin: EdgeInsets.only(bottom: 5),
            child: PhoneNumberInput(
              controller: phoneNumber,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          ResponsiveState(
            state: authProv.state,
            busyWidget: Center(
              child: CircularProgressIndicator(
                color: appPrimaryColor,
              ),
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
                      bool res = await authProv.createBusinessProfile(
                          selectedSchoolType.toLowerCase().replaceAll(" ", ""),
                          widget.nameController!.text,
                          widget.postalCodeController!.text,
                          widget.addressController!.text,
                          widget.businessEmailController!.text,
                          pNumber,
                          widget.websiteController!.text);

                      if (res) {
                        Get.to(ProfilePicture(
                          businessName: widget.nameController!.text,
                        ));
                      }
                    },
                  ))
                ],
              ),
            ),
          ),
          vertical30,
        ],
      ),
    );
  }
}
