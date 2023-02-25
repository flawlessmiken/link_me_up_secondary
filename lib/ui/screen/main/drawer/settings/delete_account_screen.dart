import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:pinput/pinput.dart';
import '../../../../../constants/colors.dart';
import '../../../../styles/text_styles.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/custom_button.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  bool hasError = false;
  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
    // textStyle: GoogleFonts.poppins(
    //     fontSize: 22, color: Color.fromRGBO(30, 60, 87, 1)),
    decoration: BoxDecoration(),
  );
  final cursor = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 40,
        height: 2,
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
  final preFilledWidget = Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        width: 40,
        height: 2,
        decoration: BoxDecoration(
          color: Colors.grey.shade600,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ],
  );
    return Scaffold(
        body: Column(
      children: [
        CustomAppBar(
          title: 'Delete Account',
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    ' • Delete account from Linkmeup\n • Erase all entry history\n • Delete all contacts on directory\n • Delete users using this account',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(4)),
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                text: 'DELETE ACCOUNT',
                onPressed: () {
                   showDialog(
                                    barrierDismissible: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        contentPadding: EdgeInsets.zero,
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 40,
                                              decoration: BoxDecoration(
                                                  color: appPrimaryColor),
                                              child: Center(
                                                child: Text(
                                                  "LMU SECURITY",
                                                  style: txStyle14wt,
                                                ),
                                              ),
                                            ),
                                            vertical20,
                                            Text(
                                              "Please enter your pin",
                                              style: txStyle16.copyWith(
                                                  color: Color(0xffE41521)),
                                            ),
                                            vertical20,
                                            Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Pinput(
                                                  // validator: (value) => model.validateOTP(value),
                                                  length: 4,
                                                  obscureText: true,
                                                  pinAnimationType:
                                                      PinAnimationType.slide,
                                                  controller: _pinPutController,
                                                  focusNode: _pinPutFocusNode,
                                                  defaultPinTheme:
                                                      defaultPinTheme,
                                                  forceErrorState: hasError,
                                                  showCursor: true,
                                                  cursor: cursor,
                                                  obscuringCharacter: '*',
                                                  preFilledWidget:
                                                      preFilledWidget,
                                                ),
                                              ),
                                            ),
                                            vertical20,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    // Get.to(EditProfile());
                                                  },
                                                  child: Container(
                                                    height: 35,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: appPrimaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                      "Verify",
                                                      style: txStyle14wt,
                                                    )),
                                                  ),
                                                ),
                                                horizontalx20,
                                                Container(
                                                  height: 35,
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xffE41521),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                      child: Text(
                                                    "Cancel",
                                                    style: txStyle14wt,
                                                  )),
                                                ),
                                              ],
                                            ),
                                            vertical20,
                                          ],
                                        ),
                                      );
                                    });
                },
                backgroundColor: Color(0xffF30101),
                borderColor: Color(0xffF30101),
              ))
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.heightOf(3),
        )
      ],
    ));
  }
}
