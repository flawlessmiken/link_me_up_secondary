import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_textfield.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Change password',
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter old password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  CustomTextField(
                    obscureText: true,
                    labelText: 'Old password',
                    hintText: '********',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter new password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  CustomTextField(
                    obscureText: true,
                    labelText: 'New password',
                    hintText: '********',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Confirm new password',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  CustomTextField(
                    obscureText: true,
                    labelText: 'New password',
                    hintText: '********',
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
            child: Row(
              children: [
                Expanded(
                    child: CustomButton(
                  text: 'Change',
                  onPressed: () {},
                ))
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.heightOf(3),
          )
        ],
      ),
    );
  }
}
