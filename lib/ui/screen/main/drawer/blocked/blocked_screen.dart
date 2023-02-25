import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';

class BlockedScreen extends StatelessWidget {
  BlockedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Blocked',
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ))
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: UserImageIcon(
                            imageUrl: "${userList[index]['image']}",
                          ),
                          title: Text(userList[index]['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              )),
                          subtitle: Text(userList[index]['@'],
                              style: txStyle12.copyWith(color: Colors.grey)),
                          trailing: Text(userList[index]['role'],
                              style: txStyle12.copyWith(color: Colors.grey)),
                        ),
                      );
                    })),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List userList = [
    {
      "name": "Nonso Godfrey",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
      "@": "@nonsogodfrey",
      "role": "Admin",
      "status": "in",
    },
    {
      "name": "Chiamaka",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
      "@": "@lindageorge",
      "role": "Sub-Admin",
      "status": "out",
    },
    {
      "name": "Nonso Godfrey",
      "@": "@nonsogodfrey",
      "role": "Sub-Admin",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
      "status": "out",
    },
    {
      "name": "Theresa Webb",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
      "@": "@lindageorge",
      "role": "Receptionist",
      "status": "out",
    },
    {
      "name": "Caleb Okeleke",
      "@": "@lindageorge",
      "role": "Receptionist",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
      "status": "Dismissed",
    },
    {
      "name": "Ronald Richards",
      "@": "@lindageorge",
      "role": "sub-Admin",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
      "status": "in",
    },
    {
      "name": "Linda George",
      "@": "@lindageorge",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
      "role": "Security",
      "status": "in",
    },
  ];
}
