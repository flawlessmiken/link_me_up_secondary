import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // this is temporary, The proper way to implement a splash screen will be done very soon
    // Timer(const Duration(seconds: 20),
    //     () => Navigator.of(context).pushReplacementNamed(RouteNames.homePage));
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthOf(5), vertical: 20),
              child: Center(
                child: Column(
                  children: [
                    Spacer(),
                    // Image(
                    //   image: AssetImage('assets/primarylogo.png'),
                    //   height: 90,
                    //   width: 90,
                    // ),
                    vertical20,
                    Container(
                      margin: EdgeInsets.only(right: 35),
                      child: SvgPicture.asset(
                        'assets/logo.svg',
                        height: 98,
                        width: 86,
                      ),
                    ),
                    vertical20,
                    Text(
                      'Linkmeup Security',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'identity & Access management',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(.9),
                          fontWeight: FontWeight.normal),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            borderColor: Colors.white,
                            backgroundColor: Colors.white,
                            text: 'Get started',
                            textColor: Theme.of(context).primaryColor,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    vertical30
                    // Spacer(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            // height: 200,
            // width: 100,
            // color: Colors.accents,
            child: SvgPicture.asset(
              'assets/ellipse.svg',
            ),
          ),
        ],
      ),
    );
  }
}
