import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

import '../../../constants/route_names.dart';
import '../../size_config/size_config.dart';
import '../../widgets/custom_button.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  /// init Size Config
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SizeConfig().init(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthOf(5), vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              const Image(
                image: AssetImage('assets/primarylogo.png'),
                height: 90,
                width: 90,
              ),
              const Text('Linkmeup',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
               Text('...your personal identity',
                  style: txStyle15wt),
              const Spacer(),
              ///// Custom Button /////
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      onPressed: () async {
                        Navigator.pushNamed(
                            context, RouteNames.loginSignUpScreen);
                      },
                      textColor: Colors.white,
                      text: 'Get Started',
                      backgroundColor: Theme.of(context).highlightColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => TempLoginScreen()));
                },
                child: Center(
                  child: Text("Login", style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
