import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? disabledColor;
  final Color? borderColor;
  final Color? textColor;
  final String? text;
  final Widget? leading;
  final VoidCallback? onPressed;
  const CustomButton({
    Key? key,
    this.backgroundColor,
    this.text = "null",
    this.leading,
    this.onPressed,
    this.textColor = Colors.white,
    this.borderColor,
    this.disabledColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextButton(
        
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
              Radius.circular(30),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
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
      ),
    );
  }
}
