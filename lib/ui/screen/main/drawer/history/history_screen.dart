import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/mixin/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/history/history_details_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/core/repositories/user_repository.dart';
import '../../../../size_config/size_config.dart';
import '../../../../styles/text_styles.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: '',
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              IconButton(onPressed: () {}, icon: Icon(Icons.share)),
              IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                        )),
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => SortSheet());
                  },
                  icon: Icon(Icons.sort)),
            ],
          ),
          Expanded(
            child: Column(
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
                    horizontalx10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${DateFormat('EEEE').format(DateTime.now())}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            )),
                        Row(
                          children: [
                            Text(
                                '${DateFormat('MMMM-yyyy').format(DateTime.now())}',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                )),
                            Icon(
                              Icons.arrow_drop_down,
                              size: 18,
                            )
                          ],
                        )
                      ],
                    )
                  ]),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'You have 1 entries',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                vertical20,
                DefaultTabController(
                    length: 2,
                    child: Builder(builder: (BuildContext context) {
                      final TabController? tabController =
                          DefaultTabController.of(context);
                      tabController?.addListener(
                        () {
                          if (!tabController.indexIsChanging) {}
                        },
                      );
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    height: SizeConfig.heightOf(6),
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TabBar(
                                        enableFeedback: true,
                                        indicator: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        labelColor: Colors.black,
                                        unselectedLabelColor:
                                            Colors.black.withOpacity(0.5),
                                        tabs: const [
                                         
                                          Tab(
                                            text: 'Guest',
                                          ),
                                          Tab(
                                            text: 'Staff',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Flexible(
                                      child: TabBarView(
                                    children: [
                                      GuestHistory(),
                                      StaffHistory()
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AllHistory extends StatefulWidget {
  const AllHistory({Key? key}) : super(key: key);

  @override
  State<AllHistory> createState() => _AllHistoryState();
}

class _AllHistoryState extends State<AllHistory> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 1,
          itemBuilder: ((context, index) {
            return InkWell(
              onTap: () {
                Get.to(HistoryDetailsScreen());
              },
              child: ListTile(
                leading: UserImageIcon(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU"),
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
                trailing: Text('Admin',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
              ),
            );
          })),
    );
  }
}

class GuestHistory extends StatefulWidget {
  const GuestHistory({Key? key}) : super(key: key);

  @override
  State<GuestHistory> createState() => _GuestHistoryState();
}

class _GuestHistoryState extends State<GuestHistory> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ResponsiveState(
        state: userProv.state,
        busyWidget: Center(
          child: CircularProgressIndicator(
            color: appPrimaryColor,
          ),
        ),
        idleWidget: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: userProv.guestHistory.data?.length,
              itemBuilder: ((context, index) {
                var data = userProv.guestHistory.data?.elementAt(index);
                return InkWell(
                  onTap: () {
                    userProv.getGuestHistoryDetails("${data?.id}");
                    Get.to(HistoryDetailsScreen());
                  },
                  child: ListTile(
                    leading: UserImageIcon(imageUrl: "${data?.profilePicture}"),
                    title: Text(capitalizeFirstText("${data?.name}"),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                    subtitle: Text('@${data?.nameTag}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        )),
                    trailing: Column(
                      children: [
                        Text(
                            DateFormat.MMMMd()
                                .format(data?.date ?? DateTime.now()),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                        Text('${data?.total}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}

class StaffHistory extends StatefulWidget {
  const StaffHistory({Key? key}) : super(key: key);

  @override
  State<StaffHistory> createState() => _StaffHistoryState();
}

class _StaffHistoryState extends State<StaffHistory> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ResponsiveState(
        state: userProv.state,
        busyWidget: Center(
          child: CircularProgressIndicator(
            color: appPrimaryColor,
          ),
        ),
        idleWidget: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: userProv.staffHistory.data?.length,
              itemBuilder: ((context, index) {
                var data = userProv.staffHistory.data?.elementAt(index);
                return InkWell(
                  onTap: () {
                    userProv.getUserHistoryDetails("${data?.id}");
                    Get.to(HistoryDetailsScreen());
                  },
                  child: ListTile(
                    leading: UserImageIcon(imageUrl: "${data?.profilePicture}"),
                    title: Text(capitalizeFirstText("${data?.name}"),
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        )),
                    subtitle: Text('@${data?.nameTag}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        )),
                    trailing: Column(
                      children: [
                        Text(
                            DateFormat.MMMMd()
                                .format(data?.date ?? DateTime.now()),
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            )),
                        Text('${data?.total}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    );
  }
}

class SortSheet extends StatefulWidget {
  const SortSheet({Key? key}) : super(key: key);

  @override
  State<SortSheet> createState() => _SortSheetState();
}

class _SortSheetState extends State<SortSheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4), vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 1,
            width: 30,
            color: Colors.black,
          ),
          vertical10,
          Text(
            "Filter",
            style: txStyle16,
          ),
          vertical30,
          filterOptions(
            title: "all",
            icon: "assets/svg_icon/all.svg",
          ),
          vertical20,
          filterOptions(
            title: "In",
            icon: "assets/svg_icon/with_sticker.svg",
          ),
          vertical20,
          filterOptions(
            title: "Out",
            icon: "assets/svg_icon/without_sticker.svg",
          ),
          vertical20,
          filterOptions(
            title: "Doorbell",
            icon: "assets/svg_icon/notificationnotification.svg",
          ),
          vertical20,
          filterOptions(
            title: "Dismissed",
            icon: "assets/svg_icon/dismissed.svg",
          ),
          vertical20,
          vertical30
        ],
      ),
    );
  }
}

class filterOptions extends StatelessWidget {
  final String title;
  final String icon;

  const filterOptions({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        horizontalx10,
        Text(
          title,
          style: txStyle17,
        ),
      ],
    );
  }
}
