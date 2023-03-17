// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

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
  FocusNode _focus = FocusNode();

  StreamController<bool> focusController = StreamController<bool>.broadcast();

  @override
  void initState() {
    super.initState();

    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    focusController.close();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    // setState(() {});
    focusController.add(_focus.hasFocus);
  }

//String dropdownValue = 'Select from the list below';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelText != null
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthOf(1), vertical: 2.75),
                child: Text(
                  widget.labelText!,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        Column(
          children: [
            StreamBuilder<Object>(
                stream: focusController.stream,
                builder: (context, snapshot) {
                  return Container(
                    height: 58,
                    // width: SizeConfig.screenWidth,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: snapshot.data == true
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).hintColor)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 2),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          focusNode: _focus,
                          value: widget.selectedValue,
                          style: const TextStyle(color: Colors.deepPurple),
                          items: widget.dropdownItem
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
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
                  );
                }),

            //buildUi(widget.selectedValue)
          ],
        )
      ],
    );
  }
}
