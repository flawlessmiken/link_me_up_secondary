// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';

import '../../../../../api/core/models/history_details_model.dart';
import '../../../../size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';

class AppointmentList extends StatelessWidget {
  final HistoryDetailsModel details;

  const AppointmentList({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthOf(5),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: UserImageIcon(
                        imageUrl: "${details.data?.profilePicture}",
                        radius: 120,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        capitalizeFirstText("${details.data?.name}"),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Center(
                      child: Text(
                        '@${details.data?.nameTag}',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 14),
                      ),
                    ),
                    vertical20,
                    Center(
                        child: Text(
                            capitalizeFirstText("${details.data?.userType}"),
                            style: TextStyle(fontSize: 16))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Appointment list', style: TextStyle(fontSize: 16)),
                    vertical20,
                    details.data!.appointments!.isNotEmpty
                        ? MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            removeBottom: true,
                            child: Expanded(
                              child: ListView.builder(
                                  itemCount: 20,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = details.data?.appointments
                                        ?.elementAt(0);
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      child: appointment_list(
                                        leading1: '${data?.startTime}',
                                        leading2: '${data?.endTime}',
                                        title1: '${data?.title}',
                                        title2: '${data?.organiser}',
                                        subtitle: '${data?.address}',
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : Center(
                            child: Text(
                              "User does not have any appointment!",
                              style: txStyle14.copyWith(color: Colors.grey),
                            ),
                          )
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

class appointment_list extends StatelessWidget {
  final String title1;
  final String title2;
  final String leading1;
  final String leading2;
  final String subtitle;

  const appointment_list({
    Key? key,
    required this.title1,
    required this.title2,
    required this.leading1,
    required this.leading2,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        children: [
          Text(
            leading1,
            style: txStyle14,
          ),
          Text(
            leading2,
            style: txStyle14,
          ),
        ],
      ),
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title1,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        Text(
          title2,
          style: txStyle14.copyWith(
              color: Colors.grey, fontWeight: FontWeight.w600),
        ),
      ]),
      subtitle: Text(subtitle, style: txStyle14.copyWith(color: Colors.grey)),
    );
  }
}
