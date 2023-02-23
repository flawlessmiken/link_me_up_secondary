import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

class AlertItem extends StatelessWidget {
  final String title;
  final bool value;
  final bool showOnlyText;
  final VoidCallback? onPressed;
  final bool showDivider, makeBoxLeading;

  AlertItem(
      {Key? key,
      required this.title,
      required this.value,
      this.onPressed,
      this.showDivider = true,
      this.makeBoxLeading = false,
      this.showOnlyText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            children: [
              showOnlyText
                  ? SizedBox.shrink()
                  : makeBoxLeading
                      ? value
                          ? const Icon(
                              Icons.check_circle,
                              color: Color(0xff3F37C9),
                            )
                          : const Icon(
                              Icons.check_circle_outline,
                              color: Colors.grey,
                            )
                      : horizontalx2,
              horizontalx10,
              Text(
                title,
                style: TextStyle(fontSize: 16),
              ),
              Spacer(),
              showOnlyText
                  ? SizedBox.shrink()
                  : !makeBoxLeading
                      ? value
                          ? const Icon(
                              Icons.check_circle,
                              color: Color(0xff3F37C9),
                            )
                          : const Icon(
                              Icons.check_circle_outline,
                              color: Colors.grey,
                            )
                      : horizontalx2,
            ],
          ),
          showDivider ? Divider() : SizedBox.shrink(),
        ],
      ),
    );
  }
}
