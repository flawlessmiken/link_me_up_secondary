import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:provider/provider.dart';

import '../../../../../api/repositories/user_repository.dart';
import '../../../../size_config/size_config.dart';
import '../../../../styles/text_styles.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';
import '../history/history_screen.dart';

class ClockingScreen extends StatefulWidget {
  const ClockingScreen({Key? key}) : super(key: key);

  @override
  State<ClockingScreen> createState() => _ClockingScreenState();
}

class _ClockingScreenState extends State<ClockingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: '',
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.search)),
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
                                        tabs: [
                                          Tab(
                                            child: Text(
                                              "Clock In",
                                              style: txStyle16.copyWith(
                                                  color: appPrimaryColor),
                                            ),
                                          ),
                                          Tab(
                                            child: Text(
                                              "Clock Out",
                                              style: txStyle16.copyWith(
                                                  color: Color(0XFFF30101)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Flexible(
                                      child: TabBarView(
                                    children: [
                                      ClockInList(),
                                      ClockOutList(),
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

class ClockInList extends StatelessWidget {
  const ClockInList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ResponsiveState(
        state: userProv.state,
        busyWidget: Center(
          child: Center(
            child: CircularProgressIndicator(
              color: appPrimaryColor,
            ),
          ),
        ),
        idleWidget: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: userProv.clock_in_list.isEmpty
              ? Column(
                  children: [
                    vertical30,
                    SvgPicture.asset("assets/svg_icon/empty_entries.svg"),
                    Text(
                      "No entries for today",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: userProv.clock_in_list.length,
                  itemBuilder: ((context, index) {
                    var data = userProv.clock_in_list.elementAt(index);
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(HistoryDetailsScreen());
                          },
                          child: ListTile(
                            leading: UserImageIcon(
                                imageUrl: "${data.profilePicture}"),
                            title: Text(capitalizeFirstText("${data.name}"),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            subtitle: Text('@${data.nameTag}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                )),
                            trailing: Text('${data.time}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        vertical10
                      ],
                    );
                  })),
        ),
      ),
    );
  }
}

class ClockOutList extends StatelessWidget {
  const ClockOutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ResponsiveState(
        state: userProv.state,
        busyWidget: Center(
          child: Center(
            child: CircularProgressIndicator(
              color: appPrimaryColor,
            ),
          ),
        ),
        idleWidget: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: userProv.clock_out_list.isEmpty
              ? Column(
                  children: [
                    vertical30,
                    SvgPicture.asset("assets/svg_icon/empty_entries.svg"),
                    Text(
                      "No entries for today",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: userProv.clock_out_list.length,
                  itemBuilder: ((context, index) {
                    var data = userProv.clock_out_list.elementAt(index);
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(HistoryDetailsScreen());
                          },
                          child: ListTile(
                            leading: UserImageIcon(
                                imageUrl: "${data.profilePicture}"),
                            title: Text(capitalizeFirstText("${data.name}"),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                )),
                            subtitle: Text('@${data.nameTag}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                )),
                            trailing: Text('${data.time}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                        vertical10,
                      ],
                    );
                  })),
        ),
      ),
    );
  }
}
