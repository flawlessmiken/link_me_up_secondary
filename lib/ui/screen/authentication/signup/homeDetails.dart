// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/profile_picture_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:phone_form_field/phone_form_field.dart';

import 'package:provider/provider.dart';

import '../../../../api/repositories/auth_repository.dart';
import '../../../../constants/colors.dart';
import '../../../responsive_state/responsive_state.dart';
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

    final authProv = Provider.of<AuthRepository>(context);

    return Form(
      key: _key,
      child: Column(
        children: [
          CustomTextField(
            labelText: 'Home Name',
            controller: nameController,
            validator: (value) => authProv.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,
          CustomTextField(
            labelText: 'Home Address',
            controller: addressController,
            validator: (value) => authProv.validateName(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          vertical10,
          CustomTextField(
            labelText: 'Postal Code',
            controller: postalCodeController,
            textInputType: TextInputType.number,
            validator: (value) => authProv.validateZip(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            isDate: true,
          ),
          vertical10,
          CustomTextField(
            labelText: 'Home Email Address ',
            controller: businessEmailController,
            textInputType: TextInputType.emailAddress,
            validator: (value) => authProv.validateEmail(value!),
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
          
                      if (!_key.currentState!.validate()) return;
                      var pNumber =
                          '${phoneNumber.value?.countryCode}${phoneNumber.value?.nsn}';
                      bool res = await authProv.createBusinessProfile(
                          "home",
                          nameController!.text,
                          postalCodeController!.text,
                          addressController!.text,
                          businessEmailController!.text,
                          pNumber,
                          "");
          
                      if (res) {
                        Get.to(ProfilePicture(
                          businessName: nameController!.text,

                        ));
                      }
                    },
                  ))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
