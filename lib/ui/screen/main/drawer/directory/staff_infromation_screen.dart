import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/small_custon_textfield.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';

import '../../../../widgets/app_bar.dart';

class StaffInformation extends StatelessWidget {
  const StaffInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.block,
                    color: Color(0XFFF30101),
                  ))
            ],
          ),
          Expanded(
            child: Padding(
              padding:  EdgeInsets.symmetric(vertical: 10, horizontal: SizeConfig.widthOf(4)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: UserImageIcon(
                        imageUrl:
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgyzAT-K4vq9i94N0B5_N2RJteGwxzZTQWcQ&usqp=CAU",
                        radius: 120,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Chiamaka Odum',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Center(
                      child: Text(
                        '@chiamakaodum22',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ),
                    vertical20,
                    Center(
                        child: Text('Staff',
                            style: TextStyle(
                              fontSize: 18,
                            ))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Personal Contact', style: txStyle14),
                    SmallCustomTextField(
                      labelText: 'phone',
                      readOnly: true,
                      hintText: '+234802 345 6789',
                    ),
                    SmallCustomTextField(
                      labelText: 'Email',
                      readOnly: true,
                      hintText: 'nonsogodfrey@gmail.com',
                    ),
                    SmallCustomTextField(
                      labelText: 'Personal website',
                      readOnly: true,
                      hintText: 'www.nonsogodfrey.com',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Staff Details',
                      style:
                          txStyle14,
                    ),
                    SmallCustomTextField(
                      labelText: 'Phone number',
                      readOnly: true,
                      hintText: '+234803 559 1234',
                    ),
                    SmallCustomTextField(
                      labelText: 'Direct line',
                      readOnly: true,
                      hintText: '+23401 035 5912- Ext 11',
                    ),
                    SmallCustomTextField(
                      labelText: 'Email',
                      readOnly: true,
                      hintText: 'nonsogodfrey@work.com',
                    ),
                    SmallCustomTextField(
                      labelText: 'Designation',
                      readOnly: true,
                      hintText: 'Proffessor',
                    ),
                    SmallCustomTextField(
                      labelText: 'Department',
                      readOnly: true,
                      hintText: 'Sciences',
                    ),
                    SmallCustomTextField(
                      labelText: 'Company name',
                      readOnly: true,
                      hintText: 'University of Lagos',
                    ),
                    SmallCustomTextField(
                      labelText: 'Company name tag',
                      readOnly: true,
                      hintText: '@Unilag',
                    ),
                    SmallCustomTextField(
                      labelText: 'Company website',
                      readOnly: true,
                      hintText: 'www.unilag.edu',
                    ),
                    SmallCustomTextField(
                      labelText: 'Company  Address',
                      readOnly: true,
                      hintText: '2343 Akoka, Yaba, Lagos, Nigeria',
                    ),
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
