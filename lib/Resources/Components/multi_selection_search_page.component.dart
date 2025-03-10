import 'dart:convert';

import 'package:flutter/material.dart';

import '../Constants/global_variables.dart';
import 'button.dart';
import 'search_textfield.dart';
import 'texts.dart';

class MultiSelectionSearchPage extends StatefulWidget {
  List data;
  String firstSearchColumn;
  String? secondSearchColumn;
  ScrollPhysics? scrollPhysics;
  MultiSelectionSearchPage(
      {super.key,
      required this.data,
      required this.firstSearchColumn,
      this.secondSearchColumn,
      this.scrollPhysics = const BouncingScrollPhysics()});

  @override
  State<MultiSelectionSearchPage> createState() =>
      _MultiSelectionSearchPageState();
}

class _MultiSelectionSearchPageState extends State<MultiSelectionSearchPage> {
  final TextEditingController _searchCtrller = TextEditingController();
  List searchData = [];
  List selectedItems = [];
  @override
  void initState() {
    super.initState();
    searchData = widget.data;
    _searchCtrller.addListener(() {
      if (_searchCtrller.text.isNotEmpty) {
        if (widget.secondSearchColumn != null) {
          searchData = widget.data
              .where((item) =>
                  item[widget.firstSearchColumn]
                      .toString()
                      .trim()
                      .toLowerCase()
                      .contains(_searchCtrller.text.toLowerCase().trim()) ||
                  item[widget.secondSearchColumn]
                      .toString()
                      .trim()
                      .toLowerCase()
                      .contains(_searchCtrller.text.toLowerCase().trim()))
              .toList();
        } else {
          searchData = widget.data
              .where((item) => item[widget.firstSearchColumn]
                  .toString()
                  .trim()
                  .toLowerCase()
                  .contains(_searchCtrller.text.toLowerCase().trim()))
              .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchTextFormFieldWidget(
            hintText: 'Recherchez',
            textColor: AppColors.kBlackColor,
            backColor: AppColors.kTextFormBackColor,
            editCtrller: _searchCtrller,
            maxLines: 1,
          ),
          Expanded(
            child: buildData(),
          ),
          CustomButton(
              // canSync: true,
              text: 'Valider',
              backColor: AppColors.kPrimaryColor,
              textColor: AppColors.kWhiteColor,
              callback: () {
                print('set');
                Navigator.pop(context, jsonEncode(selectedItems));
              })
        ],
      ),
    );
  }

  buildData() {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              physics: widget.scrollPhysics,
              itemCount: searchData.length,
              itemBuilder: (context, index) {
                Map data = searchData[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: ListTile(
                    onTap: () {
                      if (selectedItems
                          .map((e) => e[widget.firstSearchColumn])
                          .contains(data[widget.firstSearchColumn])) {
                        selectedItems.remove(data);
                      } else {
                        selectedItems.add(data);
                      }
                      // print(searchData[index][widget.firstSearchColumn]);
                      setState(() {});
                      // print(selectedItems);
                      // close(context, jsonEncode(searchData[index]));
                      // Navigator.pop(context, jsonEncode(searchData[index]));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    tileColor: AppColors.kWhiteColor,
                    leading: const Icon(Icons.manage_search_rounded, size: 48),
                    title: TextWidgets.textBold(
                        title: data[widget.firstSearchColumn],
                        fontSize: 18,
                        textColor: AppColors.kBlackColor),
                    subtitle: TextWidgets.text300(
                        title: data[widget.secondSearchColumn] ?? '',
                        fontSize: 14,
                        textColor: AppColors.kBlackColor),
                    trailing: Icon(selectedItems
                            .map((e) => e[widget.firstSearchColumn])
                            .contains(data[widget.firstSearchColumn])
                        ? Icons.check_circle
                        : Icons.arrow_forward_ios_outlined),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
