// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/profile_picture_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:phone_form_field/phone_form_field.dart';


import 'package:provider/provider.dart';

import '../../../../api/core/repositories/auth_repository.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/phone_number_input.dart';

class Home extends StatelessWidget {
  final TextEditingController? nameController;
  final TextEditingController? addressController;
  final TextEditingController? postalCodeController;
  final TextEditingController? businessEmailController;
  final TextEditingController? businessPhoneController;
  final GlobalKey<FormState>? formKey;

   Home({
    Key? key,
    this.formKey,
    this.nameController,
    this.addressController,
    this.postalCodeController,
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
            labelText: 'Home Name',
            controller: nameController,
            validator: (value) => model.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,
          CustomTextField(
            labelText: 'Home Address',
            controller: addressController,
            validator: (value) => model.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,

          CustomTextField(
            labelText: 'Postal Code',
            controller: postalCodeController,
            textInputType: TextInputType.number,
            validator: (value) => model.validateZip(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isDate: true,
          ),
          vertical10,

          CustomTextField(
            labelText: 'Home Email Address ',
            controller: businessEmailController,
            textInputType: TextInputType.emailAddress,
            validator: (value) => model.validateEmail(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    //               businessEmailController:
                    //                   businessEmailController.text,
                    //               businessPhoneController:
                    //                   businessPhoneController.text,
                    //               category: 'Home',
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
