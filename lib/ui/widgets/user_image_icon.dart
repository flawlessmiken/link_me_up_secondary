import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserImageIcon extends StatelessWidget {
  UserImageIcon({
    Key? key,
    required this.imageUrl,
    this.radius = 60,
  }) : super(key: key);

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border:
                Border.all(width: 2, color: Theme.of(context).primaryColor)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius - 10),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Container(
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/face.png'), fit: BoxFit.fill)),
            ),
          ),
        ));
  }
}



class UserImageIconRect extends StatelessWidget {
  UserImageIconRect({
    Key? key,
    required this.imageUrl,
    this.radius = 70,
  }) : super(key: key);

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: radius,
        width: radius,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // border:
            //     Border.all(width: 2, color: Theme.of(context).primaryColor)
                ),
        child: ClipRRect(
           borderRadius: BorderRadius.circular(radius/7),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fill,
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Container(
              height: radius,
              width: radius,
              decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                   borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: AssetImage('assets/face.png'), fit: BoxFit.fill)),
            ),
          ),
        ));
  }
}
