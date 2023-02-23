// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:link_me_up_secondary/constants/colors.dart';
import 'package:link_me_up_secondary/ui/size_config/size_config.dart';
import 'package:link_me_up_secondary/ui/styles/text_styles.dart';

class CustomeDropdown extends StatefulWidget {
  final String ? labelText;
  final Function(String?)? onChanged;
  // final String hintText;
  final String ?selectedValue;
  final List<String>? dropdownItem;
  final bool ? buildUi;
  // final bool isDate;
  // final Color fillColor;
  // final bool isDropdown;
  // final bool hasLeading;
  // final bool isPassword;
  // final bool isUnderlineStyle;
  // final bool textAlign;
  // final TextEditingController controller;
   const CustomeDropdown({
    Key? key,
    this.labelText,
    // this.hintText,
    // this.leading,
    this.dropdownItem,
    this.buildUi = false,
    // this.isDate = false,
    // this.isDropdown = false,
    // this.hasLeading = false,
    // this.isPassword = false,
    // this.isUnderlineStyle = false,
    // this.textAlign = false,
    // this.controller,
    // this.fillColor = const Color(0xffC9CAD9),
     this.onChanged, this.selectedValue = 'Select from the list below',
  }) : super(key: key);
  @override
  State<CustomeDropdown> createState() => _CustomeDropdownState();
}

class _CustomeDropdownState extends State<CustomeDropdown> {
//String dropdownValue = 'Select from the list below';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(1)),
          child: Text(
            "${widget.labelText}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        vertical5,
        Column(
          children: [
            Container(
              height: 52,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: appPrimaryColor)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    
                    value: widget.selectedValue,
                    style: const TextStyle(color: Colors.black),
                    items: widget.dropdownItem
                        !.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            value,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: widget.onChanged,
                    // onChanged: (String newValue) {
                    //   // ignore: void_checks
                    //   setState(() {
                    //     dropdownValue = newValue;
                    //     studentDropdownOption = dropdownValue;
                    //     print(studentDropdownOption);
                    //     if (widget.buildUi) {
                    //       buildUi(newValue);
                    //     } else {
                    //       return Text('');
                    //     }
                    //   });
                    // },
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 30,
                    isExpanded: true,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //buildUi(widget.selectedValue)
          ],
        )
      ],
    );
  }


}


// change dropdown icon
// pin scree
// connect with freinds after 
// bold blue 
// fontweight for notification screnn
// deep red color for notification // decline button 
// back button oon the share contacts