// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import '../../../../widgets/app_bar.dart';
import '../../../../widgets/user_image_icon.dart';

class AppointmentList extends StatelessWidget {
  const AppointmentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                vertical50,
                Text('Appointment list',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {},
                  child: appointment_list(
                    leading1: '2:30PM',
                    leading2: '3:45PM',
                    title1: 'Paycaps Project',
                    title2: 'Rasheed shakesheers',
                    subtitle: 'Boom HQ 222 Oak Drive, New York',
                  ),
                ),
                appointment_list(
                  leading1: '2:30PM',
                  leading2: '3:45PM',
                  title1: 'Paycaps Project',
                  title2: 'Rasheed shakesheers',
                  subtitle: 'Boom HQ 222 Oak Drive, New York',
                ),
                appointment_list(
                  leading1: '2:30PM',
                  leading2: '3:45PM',
                  title1: 'Paycaps Project',
                  title2: 'Rasheed shakesheers',
                  subtitle: 'Boom HQ 222 Oak Drive, New York',
                ),
              ],
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
