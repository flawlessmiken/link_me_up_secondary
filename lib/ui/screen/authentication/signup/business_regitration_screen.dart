import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/authentication/signup/schoolDetails.dart';
import 'package:provider/provider.dart';

import '../../../../api/repositories/auth_repository.dart';
import '../../../widgets/app_bar.dart';
import '../../../widgets/registration_drop_down.dart';
import 'businessDetails.dart';
import 'estateDetails.dart';
import 'homeDetails.dart';


class CategoryType{
  static const String HOME = 'HOME';
  static const String ESTATE = 'ESTATE';
  static const String SCHOOL = 'SCHOOL';
  static const String BUSINESS = 'BUSINESS';

}



class BusinessRegistration extends StatefulWidget {
  const BusinessRegistration({Key? key}) : super(key: key);

  @override
  State<BusinessRegistration> createState() => _BusinessRegistrationState();
}

class _BusinessRegistrationState extends State<BusinessRegistration> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController websiteController = TextEditingController();
  final TextEditingController businessEmailController = TextEditingController();
  final TextEditingController businessPhoneController = TextEditingController();
  String selectedIdentityType = CategoryType.BUSINESS;

  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);

    return Scaffold(
        body: Column(
          children: [
             CustomAppBar(
          title: 'Enter ${selectedIdentityType.toLowerCase()} details',
        ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('You’re almost done!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: appPrimaryColor.withOpacity(0.7))),
                      SizedBox(
                        height: 20,
                      ),
                      CustomeDropdown(
                        labelText: 'Category',
                        // isDropdown: true,
                        selectedValue: selectedIdentityType,
                        onChanged: (String? newValue) {
                          // ignore: void_checks
                          setState(() {
                            selectedIdentityType = newValue!;
                            //studentDropdownOption = dropdownValue;
                            print(selectedIdentityType);
                          });
                        },
                        // buildUi: true,
                        dropdownItem: const [
                          CategoryType.HOME,
                          CategoryType.ESTATE,
                          CategoryType.SCHOOL,
                          CategoryType.BUSINESS,
                          'Select from the list below'
                        ],
                      ),
                      buildUi(selectedIdentityType)
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget buildUi(String dropdownValue) {
    print('building');
    if (dropdownValue == CategoryType.BUSINESS) {
      return Business(
        nameController: nameController,
        addressController: addressController,
        postalCodeController: postalCodeController,
        businessEmailController: businessEmailController,
        businessPhoneController: businessPhoneController,
        websiteController: websiteController,
      );
    } else if (dropdownValue == CategoryType.HOME) {
      return Home(
        nameController: nameController,
        addressController: addressController,
        postalCodeController: postalCodeController,
        businessEmailController: businessEmailController,
        businessPhoneController: businessPhoneController,
      );
    } else if (dropdownValue == CategoryType.ESTATE) {
      return Estate(
        nameController: nameController,
        addressController: addressController,
        postalCodeController: postalCodeController,
        businessEmailController: businessEmailController,
        businessPhoneController: businessPhoneController,
        websiteController: websiteController,
      );
    } else if (dropdownValue == CategoryType.SCHOOL) {
      return School(
        nameController: nameController,
        addressController: addressController,
        postalCodeController: postalCodeController,
        businessEmailController: businessEmailController,
        businessPhoneController: businessPhoneController,
        websiteController: websiteController,
      );
    } else {
      return const SizedBox();
    }
  }
}
