import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

showDialogue(BuildContext context, {String? title, String? desc, String? btnText}) {
  var alertStyle = AlertStyle(
    animationType: AnimationType.fromBottom,
    isCloseButton: true,
    isOverlayTapDismiss: false,
    descStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
    descTextAlign: TextAlign.center,
    animationDuration: Duration(milliseconds: 300),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
      color: Colors.red,
      fontSize: 24,
      fontWeight: FontWeight.bold
    ),
    alertAlignment: Alignment.topCenter,
  );
  Alert(
    context: context,
    style: alertStyle,
    closeIcon: Icon(Icons.close, color: Colors.grey[500],),
    // type: AlertType.info,
    title: "Cancel your bid",
    desc: "Please confirm that you are about to cancel your bid to this task",
    image: SvgPicture.asset('assets/oops.svg', color: Colors.red, width: 80,height: 80,),
    buttons: [
      DialogButton(
        child: Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontSize: 17),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.red,
        radius: BorderRadius.circular(20.0),
      ),
    ],
  ).show();
}
