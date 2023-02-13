import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? borderColor;
  final Color? textColor;
  final IconData? icon;
  final String? text;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onPressed;
  const CustomIconButton({
    Key? key,
    this.backgroundColor,
    this.text = "null",
    this.leading,
    this.trailing,
    this.onPressed,
    this.textColor = Colors.white,
    this.borderColor,
    this.disabledColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: onPressed == null
            ? disabledColor ?? Theme.of(context).primaryColor.withOpacity(.6)
            : backgroundColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: onPressed == null
                  ? disabledColor ??
                      Theme.of(context).primaryColor.withOpacity(.1)
                  : borderColor ?? Theme.of(context).primaryColor,
              width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      icon: Icon(
        icon,
        color: textColor,
      ),
      onPressed: onPressed,
      label: Padding(
        padding: EdgeInsets.all(2.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            leading ?? Container(),
            leading == null
                ? Container()
                : SizedBox(
                    width: 20,
                  ),
            Text(
              text!,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
