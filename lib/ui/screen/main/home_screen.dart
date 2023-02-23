import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/view_state.dart';
import 'package:link_me_up_secondary/ui/screen/start_screen/login_signup_screen.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../mixin/responsive_state/responsive_state.dart';
import '../../size_config/size_config.dart';
import '../../widgets/user_image_icon.dart';

List bottomSheetItem = [
  {"title": "View Profile", "icon": "assets/svg_icon/Groupprofile.svg"},
  {"title": "Directory", "icon": "assets/svg_icon/Vectordirectory.svg"},
  {"title": "User", "icon": "assets/svg_icon/clarity_users-solidusers.svg"},
  {"title": "Order", "icon": "assets/svg_icon/Grouporder.svg"},
  {"title": "Contact", "icon": "assets/svg_icon/Vectorcontact.svg"},
  {"title": "History", "icon": "assets/svg_icon/Vectorhistory.svg"},
  {"title": "Blocked", "icon": "assets/svg_icon/Vectorblocked.svg"},
  {"title": "Subscription", "icon": "assets/svg_icon/Vectorsubscription.svg"},
  {"title": "Settings", "icon": "assets/svg_icon/settings.svg"},
  {"title": "About us", "icon": "assets/svg_icon/Vectorabout us.svg"},
  {"title": "Tell a friend", "icon": "assets/svg_icon/Grouptell a friend.svg"},
  {"title": "Logout", "icon": "assets/svg_icon/Vectorlogout.svg"}
];

List entreies = [
  {
    "name": "Nonso Godfrey",
    "image": "assets/images/entreis2.png",
    "@": "@nonsogodfrey",
    "time": "2:24 PM",
    "status": "in",
  },
  {
    "name": "Chiamaka",
    "image": "assets/images/entries1.png",
    "@": "@lindageorge",
    "time": "2:24 PM",
    "status": "in",
  },
  {
    "name": "Nonso Godfrey",
    "@": "@nonsogodfrey",
    "time": "2:24 PM",
    "image": "assets/images/entries1.png",
    "status": false,
  },
  {
    "name": "Theresa Webb",
    "image": "assets/images/entreis2.png",
    "@": "@lindageorge",
    "time": "2:24 PM",
    "status": "out",
  },
  {
    "name": "Caleb Okeleke",
    "@": "@lindageorge",
    "time": "2:24 PM",
    "image": "assets/images/entreis2.png",
    "status": "Dismissed",
  },
  {
    "name": "Ronald Richards",
    "@": "@lindageorge",
    "time": "2:24 PM",
    "image": "assets/images/entries1.png",
    "status": "Dismissed",
  },
  {
    "name": "Linda George",
    "@": "@lindageorge",
    "image": "assets/images/entreis2.png",
    "time": "2:24 PM",
    "status": "out",
  },
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    // final user = Provider.of<UserRepository>(context, listen: false);
    // user.userData();
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserRepository>(context);
    // UserProfile userData = user.user;
    // assets/svg_icon/menu.svg
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: appPrimaryColor,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15),
                      )),
                      backgroundColor: appPrimaryColor,
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => buildSheet());
                },
              );
            },
          ),
          actions: [
            SvgPicture.asset("assets/svg_icon/cameracamera.svg"),
            horizontalx20,
            SvgPicture.asset("assets/svg_icon/notificationnotification.svg"),
            horizontalx20,
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: appPrimaryColor,
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                backgroundColor: Colors.grey,
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                        onTap: () {}, child: const Text('Admin / Sub-admin')),
                    Divider(
                      color: Colors.black,
                    ),
                    InkWell(onTap: () {}, child: const Text('Reception')),
                    Divider(
                      color: Colors.black,
                    ),
                    InkWell(onTap: () {}, child: const Text('Securtiy')),
                    Divider(
                      color: Colors.black,
                    ),
                    InkWell(
                        onTap: () {
                          // Navigator.of(context).pop();
                        },
                        child: const Text('Security In')),
                    Divider(
                      color: Colors.black,
                    ),
                    InkWell(onTap: () {}, child: const Text('Security Out')),
                  ],
                ),
              ),
            );
          },
          child: Icon(Icons.qr_code_scanner),
          elevation: 5,
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 40,
              ),
            ],
          ),
          color: appPrimaryColor,
        ),
        body: ResponsiveState(
          idleWidget: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(children: [
                  Text("${DateFormat('dd').format(DateTime.now())}",
                      style: TextStyle(
                        fontSize: 55,
                        fontWeight: FontWeight.w500,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${DateFormat('EEEE').format(DateTime.now())}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )),
                      Text('${DateFormat('MMMM-yyyy').format(DateTime.now())}',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ))
                    ],
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  'You have 0 entries',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.5)),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Container(
                    height: 50,
                    width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Color(0xff25A244))),
                    child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Search Entries',
                            hintStyle: txStyle14.copyWith(color: Colors.grey),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        cursorColor: Colors.black)),
              ),
              Divider(
                color: Colors.black,
              ),
              Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: 1,
                    itemBuilder: ((context, index) {
                      return Center(
                          child: Text(
                        "No entries yet",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ));
                      // InkWell(
                      //   splashColor: appPrimaryColor,
                      //   onTap: () {
                      //     Navigator.pushNamed(
                      //         context, RouteNames.guestInformation);
                      //   },
                      //   child: ListTile(
                      //     leading: Container(
                      //       height: 55,
                      //       width: 55,
                      //       decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           image: DecorationImage(
                      //               image: AssetImage(entreies[index]['image']),
                      //               fit: BoxFit.cover)),
                      //     ),
                      //     title: Text(
                      //       entreies[index]['name'],
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.w700, fontSize: 16),
                      //     ),
                      //     subtitle: Text(
                      //       entreies[index]['@'],
                      //       style: TextStyle(
                      //           fontWeight: FontWeight.w400, fontSize: 14),
                      //     ),
                      //     trailing: Column(
                      //       children: [
                      //         Spacer(),
                      //         Text(
                      //           entreies[index]['time'],
                      //           style: TextStyle(
                      //               fontSize: 12,
                      //               color: Colors.black.withOpacity(0.5)),
                      //         ),
                      //         Text(
                      //           (entreies[index]['status'] == 'in')
                      //               ? 'in'
                      //               : 'out',
                      //           style: TextStyle(
                      //             fontSize: 14,
                      //             fontWeight: FontWeight.w300,
                      //             color: (entreies[index]['status'] == 'in')
                      //                 ? Colors.green
                      //                 : Colors.red,
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // );
                    })),
              ),
            ],
          ),
          busyWidget: Center(
            child: CircularProgressIndicator(),
          ),
          state: ViewState.Idle,
        ));
  }

  buildSheet() {
    // final user = Provider.of<UserRepository>(context);
    // UserProfile userData = user.user;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: SizeConfig.screenHeight / 1.2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // ${userData.data.pictureUrl}
                  UserImageIcon(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
                    radius: 50,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Akinsola"
                          " Akins",
                          style: txStyle14wt.copyWith(
                            fontWeight: FontWeight.w400,
                          )),
                      Text("Admin", style: txStyle12wt),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.white,
              thickness: 5,
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView.builder(
                    itemCount: bottomSheetItem.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            _onpressed(index);
                          },
                          child: Row(
                            children: [
                              SvgPicture.asset(bottomSheetItem[index]['icon']),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                bottomSheetItem[index]['title'],
                                style: txStyle17wt.copyWith(
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onpressed(int index) async {
    switch (index) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      case 11:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        bool res = await prefs.clear();
        if (res) {
          Get.offAll(LoginSignUpScreen());
        }
        break;
      default:
    }
  }
}