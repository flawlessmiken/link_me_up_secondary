import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  final String title;
  bool tap;
  ValueChanged<bool>? onChanged;
  SwitchButton({Key? key, this.title='', this.tap = false, this.onChanged})
      : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = widget.tap;
    return InkWell(
      onTap: () {
        setState(() {
          //isSwitched = !isSwitched;
        });
      },
      child: Row(
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          CupertinoSwitch(
              trackColor: Colors.grey[300],
              activeColor: Theme.of(context).primaryColor,
              value: isSwitched,
              onChanged: widget.onChanged,
              // onChanged: (value) {
              //   setState(() {
              //     isSwitched = value;
              //   });
              // }
              
              )
          // Switch(
          //   value: isSwitched,
          //   onChanged: (value) {
          //     setState(() {
          //       isSwitched = value;
          //     });
          //   },
          //   activeTrackColor: Colors.blue.shade200,
          //   activeColor: Colors.blue,
          // )
        ],
      ),
    );
  }
}
