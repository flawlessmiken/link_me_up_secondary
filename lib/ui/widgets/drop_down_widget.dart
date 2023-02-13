// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

typedef StringCallback<T> = String? Function(String?);

class CustomDropdown extends StatefulWidget {
  final String? labelText;
  final StringCallback? onChanged;
  // final String hintText;
  final String selectedValue;
  final List<String> dropdownItem;

  const CustomDropdown({
    Key? key,
    this.labelText,
    required this.dropdownItem,
    this.onChanged,
    this.selectedValue = 'Select from the list below',
  }) : super(key: key);
  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
//String dropdownValue = 'Select from the list below';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: SizeConfig.widthOf(1)),
                child: Text(
                  widget.labelText!,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Column(
          children: [
            Container(
              height: 30,
              // width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  
                  ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: widget.selectedValue,
                    style: const TextStyle(color: Colors.deepPurple),
                    items: widget.dropdownItem.
                        map<DropdownMenuItem<String>>((String value) {
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
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    iconSize: 30,
                    isExpanded: true,
                  ),
                ),
              ),
            ),
            
            //buildUi(widget.selectedValue)
          ],
        )
      ],
    );
  }
}



