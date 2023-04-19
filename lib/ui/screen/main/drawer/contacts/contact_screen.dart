import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/contacts/contact_details_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/history/contact_information_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../widgets/app_bar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Contacts',
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          ResponsiveState(
            state: userProv.state,
            busyWidget: Center(child: CircularProgressIndicator(color: appPrimaryColor,),),
            idleWidget: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userProv.contactModel.data?.length ?? 0,
                          itemBuilder: ((context, index) {
                            var contact =
                                userProv.contactModel.data?.elementAt(index);
                            return InkWell(
                              onTap: () {
                                userProv.getContactDetails("${contact?.id}");
                                Get.to(ContactDetailsScreen(
                                  id: "${contact?.id}",
                                ));
                              },
                              child: ListTile(
                                leading: UserImageIcon(
                                    imageUrl: "${contact?.profilePicture}"),
                                title: Text(
                                    capitalizeFirstText(
                                        "${contact?.firstName} ${contact?.lastName}"),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                                subtitle: Text('@${contact?.nameTag}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                              ),
                            );
                          })),
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
