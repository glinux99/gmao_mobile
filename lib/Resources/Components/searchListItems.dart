import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../Constants/global_variables.dart';

class SelectSearchList extends StatefulWidget {
  final TextEditingController textEditingController;
  final List<dynamic> items;
  final String title, hintext;
  final String searchColumn;
  const SelectSearchList({
    super.key,
    required this.textEditingController,
    required this.items,
    required this.title,
    required this.hintext,
    required this.searchColumn,
  });

  @override
  State<SelectSearchList> createState() => _SelectSearchListState();
}

class _SelectSearchListState extends State<SelectSearchList> {
  @override
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    int index;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(color: AppColors.kBlackColor.withOpacity(0.6)),
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              // searchInnerWidgetHeight: 50,
              isExpanded: true,
              hint: Text(
                widget.hintext,
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.kBlackColor,
                ),
              ),
              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                        value: item[widget.searchColumn].toString(),
                        child: Text(
                          item[widget.searchColumn],
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                  widget.textEditingController.text = value;

                  // print(widget.textEditingController.text);
                  // print(widget.selectedValue.toString());
                });
              },
              // buttonHeight: 40,
              // // buttonWidth: 200,
              // itemHeight: 40,
              // buttonDecoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(5),
              //   border: Border.all(
              //     color: AppColors.kWhiteDarkColor,
              //   ),
              //   color: AppColors.kTextFormBackColor,
              // ),
              // dropdownMaxHeight: 200,
              // searchController: widget.textEditingController,
              // searchInnerWidget: Padding(
              //   padding: const EdgeInsets.only(
              //     top: 8,
              //     bottom: 4,
              //     right: 8,
              //     left: 8,
              //   ),
              //   child: TextFormField(
              //     controller: widget.textEditingController,
              //     decoration: InputDecoration(
              //       isDense: true,
              //       contentPadding: const EdgeInsets.symmetric(
              //         horizontal: 10,
              //         vertical: 8,
              //       ),
              //       hintText: widget.hintext,
              //       hintStyle: const TextStyle(fontSize: 12),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(8),
              //       ),
              //     ),
              //   ),
              // ),
              // searchMatchFn: (item, searchValue) {
              //   return (item.value
              //       .toString()
              //       .toLowerCase()
              //       .contains(searchValue.toLowerCase().trim()));
              // },
              //This to clear the search value when you close the menu
              onMenuStateChange: (isOpen) {
                if (!isOpen) {
                  widget.textEditingController.clear();
                  // selectedValue = "";
                }
                // print("AAA");
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DropDownSimpleItems extends StatefulWidget {
  String title;
  String hintText;
  List<dynamic> items;
  late int defaultValue;
  TextEditingController? selectedValueCtrller;
  DropDownSimpleItems(
      {super.key,
      required this.title,
      required this.hintText,
      this.selectedValueCtrller,
      // this.selectedValue,
      required this.items,
      this.defaultValue = 99999});

  @override
  State<DropDownSimpleItems> createState() => _DropDownSimpleItemsState();
}

class _DropDownSimpleItemsState extends State<DropDownSimpleItems> {
  String? selectedValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedValue = widget.items[widget.defaultValue];
  }

  @override
  Widget build(BuildContext context) {
    int typeIndex = 1;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(color: AppColors.kBlackColor.withOpacity(0.6)),
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              hint: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 16,
                    color: AppColors.kBlackColor,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    child: Text(
                      widget.hintText,
                      style: TextStyle(
                        fontSize: 10,
                        color: AppColors.kBlackColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              items: widget.items
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.kBlackColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value as String;
                  widget.selectedValueCtrller?.text = value.toString();
                  // print(widget.selectedValueCtrller?.text);
                });
              },
              // icon: const Icon(
              //   Icons.arrow_forward_ios_outlined,
              // ),
              // iconSize: 14,
              // iconEnabledColor: AppColors.kWhiteColor,
              // iconDisabledColor: Colors.grey,
              // buttonHeight: 50,
              // // buttonWidth: 160,
              // buttonPadding: const EdgeInsets.only(left: 0, right: 14),
              // buttonDecoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(5),
              //   border: Border.all(
              //     color: AppColors.kWhiteDarkColor,
              //   ),
              //   color: AppColors.kTextFormBackColor,
              // ),

              // buttonElevation: 0,
              // itemHeight: 40,
              // itemPadding: const EdgeInsets.only(left: 14, right: 14),
              // dropdownMaxHeight: 200,
              // // dropdownWidth: 200,
              // dropdownPadding: null,

              // dropdownDecoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(14),
              //   color: AppColors.kWhiteColor,
              // ),
              // dropdownElevation: 4,
              // scrollbarRadius: const Radius.circular(40),
              // scrollbarThickness: 6,
              // scrollbarAlwaysShow: true,
            ),
          ),
        ],
      ),
    );
  }
}
