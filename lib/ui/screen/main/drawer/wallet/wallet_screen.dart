import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/responsive_state/responsive_state.dart';
import 'package:link_me_up_secondary/ui/screen/main/drawer/order/add_payment_screen.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';
import 'package:link_me_up_secondary/ui/widgets/app_bar.dart';
import 'package:link_me_up_secondary/ui/widgets/custom_button.dart';
import 'package:link_me_up_secondary/ui/widgets/utils.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';

import '../../../../../api/repositories/user_repository.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  bool isTransaction = true;
  late FocusNode focusNode;
  final TextEditingController amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProv = Provider.of<UserRepository>(context);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: "Linkmeup Wallet"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(5)),
              child: Column(
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: appPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthOf(2), vertical: 20),
                      child: Stack(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(right: 35),
                                child: SvgPicture.asset(
                                  'assets/logo.svg',
                                  height: 119,
                                  width: 167,
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Total Balance",
                              style: txStyle14wt,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  convertStringToCurrency("350,000"),
                                  style: txStyle25wt,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.visibility,
                                      color: Colors.white,
                                    ))
                              ],
                            )
                          ],
                        )
                      ]),
                    ),
                  ),
                  vertical10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isTransaction = true;
                          });
                        },
                        child: Container(
                          height: 50,
                          width: SizeConfig.widthOf(44),
                          decoration: BoxDecoration(
                              color: isTransaction
                                  ? appPrimaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: isTransaction
                                      ? Colors.white
                                      : appPrimaryColor),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg_icon/transaction.svg',
                                  height: 25,
                                  width: 25,
                                  color: isTransaction
                                      ? Colors.white
                                      : appPrimaryColor,
                                ),
                                horizontalx10,
                                Text(
                                  "Transaction",
                                  style: txStyle14wt.copyWith(
                                      color: isTransaction
                                          ? Colors.white
                                          : appPrimaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isTransaction = false;
                          });
                          focusNode.requestFocus();
                        },
                        child: Container(
                          height: 50,
                          width: SizeConfig.widthOf(44),
                          decoration: BoxDecoration(
                              color: !isTransaction
                                  ? appPrimaryColor
                                  : Colors.white,
                              border: Border.all(
                                  color: !isTransaction
                                      ? Colors.white
                                      : appPrimaryColor),
                              borderRadius: BorderRadius.circular(30)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg_icon/fundwallet.svg',
                                  height: 25,
                                  width: 25,
                                  color: isTransaction
                                      ? appPrimaryColor
                                      : Colors.white,
                                ),
                                horizontalx10,
                                Text(
                                  "Fund Wallet",
                                  style: txStyle14.copyWith(
                                      color: !isTransaction
                                          ? Colors.white
                                          : appPrimaryColor),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  vertical20,
                  isTransaction
                      ? Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "All",
                                    style: txStyle14,
                                  ),
                                  horizontalx10,
                                  Icon(Icons.arrow_drop_down)
                                ],
                              ),
                              Divider(),
                              vertical10,
                              ResponsiveState(
                                state: userProv.state,
                                busyWidget: Center(
                                  child: CircularProgressIndicator(
                                    color: appPrimaryColor,
                                  ),
                                ),
                                idleWidget: MediaQuery.removePadding(
                                    context: context,
                                    removeTop: true,
                                    removeBottom: true,
                                    child: userProv.walletTransaction.data
                                                ?.isEmpty ??
                                            true
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              vertical30,
                                              SvgPicture.asset(
                                                  "assets/svg_icon/empty_entries.svg"),
                                              Text(
                                                "No transactions yet",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15),
                                              ),
                                            ],
                                          )
                                        : Expanded(
                                            child: ListView.builder(
                                                itemCount: userProv
                                                        .walletTransaction
                                                        .data
                                                        ?.length ??
                                                    0,
                                                // shrinkWrap: true,
                                                itemBuilder: (context, index) {
                                                  var transaction = userProv
                                                      .walletTransaction.data
                                                      ?.elementAt(index);
                                                  return ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    leading: SvgPicture.asset(
                                                      'assets/svg_icon/money-recive.svg',
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    title: Text(
                                                      capitalizeFirstText(
                                                          "${transaction?.description}"),
                                                      style: txStyle14,
                                                    ),
                                                    subtitle: Text(
                                                      "Today 14:24",
                                                      style: txStyle12.copyWith(
                                                          color: Colors.grey),
                                                    ),
                                                    trailing: Column(
                                                      children: [
                                                        Text(
                                                          convertStringToCurrency(
                                                              "${transaction?.amount}"),
                                                          style: txStyle14,
                                                        ),
                                                        Text(
                                                          "${transaction?.status}",
                                                          style: txStyle12
                                                              .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          )),
                              )
                            ],
                          ),
                        )
                      : Expanded(
                          child: ListView(
                            children: [
                              vertical20,
                              Center(
                                child: Text(
                                  "Enter Amount",
                                  style: txStyle14,
                                ),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  SizedBox(
                                    width: SizeConfig.widthOf(50),
                                    child: TextFormField(
                                      focusNode: focusNode,
                                      textAlign: TextAlign.center,
                                      cursorColor: appPrimaryColor,
                                      style: txStyle27Bold,
                                      keyboardType: TextInputType.number,
                                      controller: amountController,
                                      inputFormatters: [ThousandsFormatter()],
                                      validator: (value) =>
                                          userProv.validateAmount(value!),
                                      decoration: InputDecoration(
                                        prefixText: "₦",
                                        hintText: '5000',
                                        hintStyle: txStyle27Bold.copyWith(
                                            color: appPrimaryColor
                                                .withOpacity(0.2),
                                            fontSize: 30),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  Spacer()
                                ],
                              ),
                              vertical30,
                              Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      text: "Proceed",
                                      onPressed: () {
                                        Get.to(AddPaymentDetails());
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
