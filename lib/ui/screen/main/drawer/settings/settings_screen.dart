import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/settings/beep_scree.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/settings/change_password_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/settings/delete_account_screen.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/settings/entry_criteria_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_switch.dart';
import '../../../../../constants/route_names.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Setting"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SwitchButton(
                  title: 'Notification',
                  tap: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Get.to(DeleteAccount());
                    },
                    child: Text('Delete account',
                        style: TextStyle(
                          fontSize: 16,
                        ))),
                const SizedBox(
                  height: 10,
                ),
                SwitchButton(
                  title: 'Vibrate',
                  tap: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(BeepScreen());
                  },
                  child: Row(
                    children: [
                      Text(
                        'Beep',
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        'Beep tone 1',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5), fontSize: 14),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SwitchButton(
                  title: 'Phone security',
                  tap: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () {
                      Get.to(EntryCriteria());
                    },
                    child: Text(
                      'Entry Criteria',
                      style: TextStyle(fontSize: 16),
                    )),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Get.to(ChangePassword());
                  },
                  child: SwitchButton(
                    title: 'Change password',
                    tap: false,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SwitchButton(
                  title: 'Reset pin',
                  tap: false,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SwitchButton extends StatefulWidget {
  final String title;
  final bool tap;
  const SwitchButton({Key? key, required this.title, required this.tap})
      : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = widget.tap;
    return SwitchButtonWidget(
      title: widget.title,
      // value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      // activeTrackColor: Colors.green.shade200,
      // activeColor: Colors.green.shade600,
    );
  }
}
