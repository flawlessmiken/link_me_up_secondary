import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/directory/staff_infromation_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';

import '../../../../widgets/app_bar.dart';

class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Directory',
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              Get.to(StaffInformation());
                            },
                            child: ListTile(
                              leading: UserImageIcon(
                                  imageUrl:
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgyzAT-K4vq9i94N0B5_N2RJteGwxzZTQWcQ&usqp=CAU"),
                              title: Text('Nonso Godfrey',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  )),
                              subtitle: Text('@NonsoGodfrey',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  )),
                              trailing: Text('Staff',
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
        ],
      ),
    );
  }
}
