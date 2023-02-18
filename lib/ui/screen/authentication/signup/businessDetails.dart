// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/profile_picture_screen.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../styles/text_styles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/phone_number_input.dart';

class Business extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? addressController;
  final TextEditingController? postalCodeController;
  final TextEditingController? websiteController;
  final TextEditingController? businessEmailController;
  final TextEditingController? businessPhoneController;
  final GlobalKey<FormState>? formKey;

   Business({
    Key? key,
    this.formKey,
    this.nameController,
    this.addressController,
    this.postalCodeController,
    this.websiteController,
    this.businessEmailController,
    this.businessPhoneController,
  }) : super(key: key);

  PhoneController phoneNumber = PhoneController(null);


  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    final model = Provider.of<AuthRepository>(context);

    return Form(
      key: _key,
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Business Name',
            controller: nameController,
            validator: (value) => model.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,
          CustomTextField(
            labelText: 'Business Address',
            controller: addressController,
            validator: (value) => model.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,
          CustomTextField(
            labelText: 'Postal Code',
            controller: postalCodeController,
            validator: (value) => model.validateZip(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isDate: true,
          ),
          vertical10,
          CustomTextField(
              controller: websiteController,
              labelText: 'Website',
              textInputType: TextInputType.url),
          vertical10,
          CustomTextField(
            labelText: 'Business Email Address ',
            controller: businessEmailController,
            validator: (value) => model.validateEmail(value!),
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
                    //         builder: (context) => ProfilePicture(
                    //               name: nameController.text,
                    //               addressController: addressController.text,
                    //               postalCodeController:
                    //                   postalCodeController.text,
                    //               websiteController: websiteController.text,
                    //               businessEmailController:
                    //                   businessEmailController.text,
                    //               businessPhoneController:
                    //                   businessPhoneController.text,
                    //               category: 'Business',
                    //             )));
                    Get.to(ProfilePicture());
                  },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
