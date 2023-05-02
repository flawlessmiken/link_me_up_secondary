// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';

import '../../../../../api/models/history_details_model.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';

class EntryDetails extends StatelessWidget {
  final HistoryDetailsModel details;

  const EntryDetails({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
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
                        child: Text("${details.data?.userType}",
                            style: TextStyle(fontSize: 16))),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('History', style: TextStyle(fontSize: 16)),
                    vertical20,
                    MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      removeBottom: true,
                      child: ListView.builder(
                          itemCount: details.data?.entryRecords?.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data =
                                details.data?.entryRecords?.elementAt(index);
                            return Column(
                              children: [
                                vertical20,
                                history(
                                    status: "${data?.entryType}",
                                    date: "${data?.date}",
                                    time: "${data?.time}",
                                    color: "${data?.entryType}" == "in"
                                        ? Colors.green
                                        : Colors.red),
                              ],
                            );
                          }),
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

class history extends StatelessWidget {
  final String status;
  final String date;
  final String time;
  final Color color;
  const history({
    Key? key,
    required this.status,
    required this.date,
    required this.time,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            status,
            style: TextStyle(color: color),
          ),
        ),
        Spacer(),
        SizedBox(
          width: 100,
          child: Row(
            children: [
              Text(
                date,
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
              // Spacer()
            ],
          ),
        ),
        Spacer(),
        Expanded(
          child: Text(
            time,
            style: TextStyle(color: Colors.black.withOpacity(0.5)),
          ),
        )
      ],
    );
  }
}
