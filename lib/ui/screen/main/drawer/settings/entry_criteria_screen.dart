import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import '../../../../widgets/app_bar.dart';
import 'beep_scree.dart';
import 'settings_screen.dart';

class EntryCriteria extends StatelessWidget {
  const EntryCriteria({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Entry Criteria',
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
            child: Column(
              children: [
                beeps(
                  title: 'Everyone',
                ),
                beeps(
                  title: 'Those in directory, only.',
                ),
                beeps(
                  title: 'Those with...',
                ),
                SwitchButton(
                  title: 'Appointment',
                  tap: false,
                ),
                SwitchButton(
                  title: 'Valid means of identification',
                  tap: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
