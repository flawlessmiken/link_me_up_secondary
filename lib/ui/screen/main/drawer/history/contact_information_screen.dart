import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';

import '../../../../../api/models/history_details_model.dart';
import '../../../../styles/text_styles.dart';
import '../../../../widgets/small_custon_textfield.dart';
import '../../../../widgets/user_image_icon.dart';

class ContactDetails extends StatefulWidget {
  final HistoryDetailsModel details;
  const ContactDetails({Key? key, required this.details}) : super(key: key);

  @override
  State<ContactDetails> createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: ""),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          UserImageIcon(
                        imageUrl:
                            "${widget.details.data?.profilePicture}",
                        radius: 120,
                      ),
                      vertical10,
                      Text(
                       capitalizeFirstText( "${widget.details.data?.name}"),
                        style: txStyle16Bold.copyWith(fontSize: 18),
                      ),
                      Text(
                        "@${widget.details.data?.nameTag}",
                        style: txStyle12.copyWith(color: Colors.grey),
                      ),
                      vertical30,
                        ],
                      ),
                    ),
                    Text('Personal Contact', style: txStyle14Bold),
                    SmallCustomTextField(
                      labelText: 'phone',
                      readOnly: true,
                      hintText: '${widget.details.data?.personalContact?.phoneNumber}',
                    ),
                    SmallCustomTextField(
                      labelText: 'Email',
                      readOnly: true,
                      hintText: '${widget.details.data?.personalContact?.email}',
                    ),
                    SmallCustomTextField(
                      labelText: 'Personal website',
                      readOnly: true,
                      hintText: '${widget.details.data?.personalContact?.website}',
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
