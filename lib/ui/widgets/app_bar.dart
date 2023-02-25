import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    @required this.title = '',
    this.leading,
    this.actions,
    this.backgroundColor,
    this.textColor,
    this.elavation = 0,
  }) : super(key: key);

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elavation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: elavation,
      iconTheme:
          IconThemeData(color: textColor ?? Theme.of(context).primaryColor),
      backgroundColor: backgroundColor ?? Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: textColor ?? Colors.white,
        statusBarColor: textColor ?? Colors.white,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: textColor ?? Colors.white,
        //Navigation bar divider color
        systemNavigationBarIconBrightness:
            Brightness.light, //navigation bar icon
      ),
      title: Text(
        title!,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: textColor ?? Colors.black),
      ),
      leading: leading ?? leading,
      actions: actions ?? actions,
    );
  }
}
