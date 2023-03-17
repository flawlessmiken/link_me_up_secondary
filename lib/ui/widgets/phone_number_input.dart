// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../size_config/size_config.dart';
import '../styles/text_styles.dart';

class PhoneNumberInput extends StatefulWidget {
  const PhoneNumberInput({Key? key, required this.controller})
      : super(key: key);

  final PhoneController controller;

  @override
  _PhoneNumberInputState createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  List<IsoCode> countries = [
    IsoCode.NG,
    IsoCode.GH,
    IsoCode.GB,
    IsoCode.KE,
    IsoCode.UG
  ];
  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthOf(1), vertical: 2.75),
            child: Text("Phone Number",
                style: txStyle16.copyWith(fontWeight: FontWeight.w500)),
          ),
          PhoneFormField(
            countrySelectorNavigator:
                CountrySelectorNavigator.searchDelegate(countries: countries),
            controller: widget.controller,
            showFlagInInput: true,
            autofocus: false,
            autofillHints: const [AutofillHints.telephoneNumber],
            shouldFormat: true,
            defaultCountry: IsoCode.NG,
            enabled: true,
            decoration: InputDecoration(
              isDense: false,
              hintText: 'Phone number',
              hintStyle: txStyle14.copyWith(color: Colors.grey),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xff25A244).withOpacity(0.5),
                  width: 1,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  width: 1,
                  style: BorderStyle.solid,
                  color: Colors.grey,
                ),
              ),
            ),
            style: txStyle14,
            validator: PhoneValidator.validMobile(),
          ),
        ],
      ),
    );
  }
}
