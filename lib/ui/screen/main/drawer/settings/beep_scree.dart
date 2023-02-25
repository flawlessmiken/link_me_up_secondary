// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../widgets/app_bar.dart';


class BeepScreen extends StatelessWidget {
  const BeepScreen({ Key ? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
        title: 'Beep tone',
      ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                beeps(title: 'Beep tone 1',),
                beeps(title: 'Beep tone 2',),
                beeps(title: 'Beep tone 3',),
                beeps(title: 'Beep tone 4',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class beeps extends StatelessWidget {
  final String title;
  const beeps({
    Key ? key,
   required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(title),
            Spacer(),
            Checkbox(value: false, onChanged: (bool ? value){})
          ],
        ),
        Divider(color: Colors.black.withOpacity(0.5))
      ],
    );
  }
}
