// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../size_config/size_config.dart';

typedef StringCallback<T> = String? Function(String?);

class CustomDropdownMain extends StatefulWidget {
  final String? labelText;
  final StringCallback? onChanged;
  // final String hintText;
  final String selectedValue;
  final IconData iconData;
  final List<String> dropdownItem;

  const CustomDropdownMain({
    Key? key,
    this.labelText,
    required this.dropdownItem,
    this.onChanged,
    this.selectedValue = 'Select from the list below',
    this.iconData = Icons.arrow_drop_down,
  }) : super(key: key);
  @override
  State<CustomDropdownMain> createState() => _CustomDropdownMainState();
}

class _CustomDropdownMainState extends State<CustomDropdownMain> {
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
              height: 50,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.black.withOpacity(0.5))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: widget.selectedValue,
                    style: const TextStyle(color: Colors.deepPurple),
                    items: widget.dropdownItem
                        .map<DropdownMenuItem<String>>((String value) {
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
                    icon: Icon(widget.iconData),
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
