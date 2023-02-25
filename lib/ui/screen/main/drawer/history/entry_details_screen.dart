// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';

class EntryDetails extends StatelessWidget {
  const EntryDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: UserImageIcon(
                    imageUrl:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrCNcCooHQ5y2Fejefl0ypuGztlKAw6kIcPw&usqp=CAU",
                    radius: 120,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    'Chiamaka Odum',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Center(
                  child: Text(
                    '@chiamakaodum22',
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.5), fontSize: 14),
                  ),
                ),
                vertical20,
                Center(child: Text('Guest', style: TextStyle(fontSize: 16))),
                const SizedBox(
                  height: 20,
                ),
                Text('Hisotry', style: TextStyle(fontSize: 16)),
                vertical20,
                history(
                  status: 'in',
                  date: '02 - 05 -2022',
                  time: '2:24 PM',
                  color: Colors.green,
                ),
                vertical20,
                history(
                  status: 'out',
                  date: '02 - 05 -2022',
                  time: '2:24 PM',
                  color: Colors.red,
                ),
                vertical20,
                history(
                  status: 'Clocked',
                  date: '02 - 05 -2022',
                  time: '2:24 PM',
                ),
                vertical20,
                history(
                  status: 'Dismissed',
                  date: '02 - 05 -2022',
                  time: '2:24 PM',
                ),
              ],
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
      children: [
        Text(
          status,
          style: TextStyle(color: color),
        ),
        Spacer(),
        Text(
          date,
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        ),
        Spacer(),
        Text(
          time,
          style: TextStyle(color: Colors.black.withOpacity(0.5)),
        )
      ],
    );
  }
}
