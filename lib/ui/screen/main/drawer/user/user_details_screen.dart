import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';

import '../../../../widgets/app_bar.dart';

class UserDetailsScreen extends StatelessWidget {
  const UserDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Users Profile',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
            child: Column(
              children: [
                UserImageIcon(
                  imageUrl:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
                  radius: 120,
                ),
                vertical30,
                SmallCustomTextField(
                  labelText: "Full name",
                  hintText: "Nonso Godfrey",
                ),
                SmallCustomTextField(
                  labelText: "Username",
                  hintText: "nonsogodfrey@gmail.com",
                ),
                SmallCustomTextField(
                  labelText: "Position",
                  hintText: "Admin",
                ),
                vertical50,
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {},
                        text: "View entry list",
                        borderColor: appPrimaryColor,
                        textColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                vertical20,
                Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        onPressed: () {},
                        text: "Edit",
                        borderColor: appPrimaryColor,
                        textColor: Colors.white,
                        backgroundColor: appPrimaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
