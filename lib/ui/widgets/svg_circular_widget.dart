import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgCircularWidget extends StatelessWidget {
  SvgCircularWidget({Key? key, this.color = Colors.white, this.icon, this.radius = 23})
      : super(key: key);
  final Color? color;
  final String? icon;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    var container = icon != null
        ? CircleAvatar(
      //     padding: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
        backgroundColor: color!.withOpacity(.06),
        radius: double.parse('${radius!+2.0}'),
        // borderRadius: BorderRadius.circular(100),
      // ),
          child: SvgPicture.asset(
              icon!,
              color: color,
              width: radius,
              height: radius,
            ),
        )
        : SizedBox.shrink();
    return container;
  }
}
