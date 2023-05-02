import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/screen/main/home_screen.dart';
import 'package:link_me_up_secondary/ui/widgets/user_image_icon.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';

import '../../../../api/repositories/auth_repository.dart';
import '../../../size_config/size_config.dart';
import 'package:provider/provider.dart';

import '../../../widgets/custom_button.dart';

class CompletionScreen extends StatefulWidget {
  const CompletionScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CompletionScreen> createState() => _CompletionScreenState();
}

class _CompletionScreenState extends State<CompletionScreen> {
  @override
  Widget build(BuildContext context) {
    final authProv = Provider.of<AuthRepository>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.heightOf(5),
              horizontal: SizeConfig.widthOf(10)),
          child: SizedBox(
            height: SizeConfig.screenHeight - SizeConfig.heightOf(10),
            child: Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.heightOf(8),
                    ),
                    UserImageIcon(
                      imageUrl:
                          "${authProv.completeProfileResponse.data?.picture}",
                      radius: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      capitalizeFirstText('${authProv.completeProfileResponse.data?.name}'),
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    Text(
                      '@${authProv.completeProfileResponse.data?.nameTag}',
                      style: Theme.of(context).primaryTextTheme.subtitle2,
                    ),
                    SizedBox(
                      height: SizeConfig.heightOf(8),
                    ),
                    Text(
                      capitalizeFirstText('${authProv.completeProfileResponse.data?.name} 👋'),
                      style: Theme.of(context).primaryTextTheme.headline3,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: SizeConfig.widthOf(70),
                      child: Text(
                        'Your profile is ready! you can add more info in preferences',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).primaryTextTheme.subtitle2,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            onPressed: () {
                              Get.offAll(HomeScreen());
                            },
                            text: 'Finish',
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget completed_task(String task) {
    return Row(
      children: [
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          task,
          style: const TextStyle(
              color: Colors.green, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
