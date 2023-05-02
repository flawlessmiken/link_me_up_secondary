import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../../api/repositories/user_repository.dart';
import '../../../../../constants/colors.dart';
import '../../../../responsive_state/responsive_state.dart';
import '../../../../size_config/size_config.dart';
import '../../../../styles/text_styles.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';
import '../../../../widgets/utils.dart';

class UserEntryList extends StatefulWidget {
  final String userImage;
  final String userName;
  final String userRole;

  const UserEntryList(
      {Key? key,
      required this.userImage,
      required this.userName,
      required this.userRole})
      : super(key: key);

  @override
  State<UserEntryList> createState() => _UserEntryListState();
}

class _UserEntryListState extends State<UserEntryList> {
  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              title: "",
            ),
            Expanded(
              child: Column(
                children: [
                  Center(
                    child: UserImageIcon(
                      imageUrl: widget.userImage,
                      radius: 120,
                    ),
                  ),
                  vertical10,
                  Text(
                    capitalizeFirstText(widget.userName),
                    style: txStyle16,
                  ),
                  vertical5,
                  Text(
                    widget.userRole,
                    style: txStyle12.copyWith(color: Colors.grey),
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )),
                        Row(
                          children: [
                            Text(
                                '${DateFormat('MMMM-yyyy').format(DateTime.now())}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
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
                                          borderRadius:
                                              BorderRadius.circular(8)),
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
                                    userProv.currentUserCategory ==
                                            userCategoryType.BUSINESS
                                        ? const Flexible(
                                            child: TabBarView(
                                            children: [
                                              GuestEntryList(),
                                              StaffEntryList()
                                            ],
                                          ))
                                        : const Flexible(
                                            child: TabBarView(
                                            children: [
                                              GuestEntryList(),
                                              StaffEntryList()
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
      ),
    );
  }
}

class GuestEntryList extends StatefulWidget {
  const GuestEntryList({Key? key}) : super(key: key);

  @override
  State<GuestEntryList> createState() => _GuestEntryListState();
}

class _GuestEntryListState extends State<GuestEntryList> {
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
          child: userProv.guestEntryModel.data?.isEmpty ?? true
              ? Column(
                  children: [
                    vertical30,
                    SvgPicture.asset("assets/svg_icon/empty_entries.svg"),
                    Text(
                      "This folder is empty",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: userProv.guestEntryModel.data?.length,
                  itemBuilder: ((context, index) {
                    var data = userProv.guestEntryModel.data?.elementAt(index);
                    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading:
                            UserImageIcon(imageUrl: "${data?.profilePicture}"),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                "${data?.time}",
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

class StaffEntryList extends StatefulWidget {
  const StaffEntryList({Key? key}) : super(key: key);

  @override
  State<StaffEntryList> createState() => _StaffEntryListState();
}

class _StaffEntryListState extends State<StaffEntryList> {
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
          child: userProv.staffEntryModel.data?.isEmpty ?? true
              ? Column(
                  children: [
                    vertical30,
                    SvgPicture.asset("assets/svg_icon/empty_entries.svg"),
                    Text(
                      "This folder is empty",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: userProv.staffEntryModel.data?.length,
                  itemBuilder: ((context, index) {
                    var data = userProv.staffEntryModel.data?.elementAt(index);
                    return InkWell(
                      onTap: () {},
                      child: ListTile(
                        leading:
                            UserImageIcon(imageUrl: "${data?.profilePicture}"),
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
                                "${data?.time}",
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
