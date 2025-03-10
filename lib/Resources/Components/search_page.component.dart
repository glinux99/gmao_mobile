import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../Resources/Components/texts.dart';
import '../../../Resources/Constants/global_variables.dart';

class CustomSearchPage extends SearchDelegate {
  List data;
  String firstSearchColumn;
  String? secondSearchColumn;
  CustomSearchPage(
      {required this.data,
      required this.firstSearchColumn,
      this.secondSearchColumn});

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  List searchData = [];
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: AppColors.kBlackColor));
  }

  @override
  Widget buildResults(BuildContext context) {
    searchData = data;
    if (query.isNotEmpty) {
      if (secondSearchColumn != null) {
        searchData = data
            .where((item) =>
                item[firstSearchColumn]
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                item[secondSearchColumn]
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()))
            .toList();
      } else {
        searchData = data
            .where((item) => item[firstSearchColumn]
                .toString()
                .trim()
                .toLowerCase()
                .contains(query.toLowerCase().trim()))
            .toList();
      }
    }
    return buildData();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    searchData = data;
    if (query.isNotEmpty) {
      if (secondSearchColumn != null) {
        searchData = data
            .where((item) =>
                item[firstSearchColumn]
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                item[secondSearchColumn]
                    .toString()
                    .trim()
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()))
            .toList();
      } else {
        searchData = data
            .where((item) => item[firstSearchColumn]
                .toString()
                .trim()
                .toLowerCase()
                .contains(query.toLowerCase().trim()))
            .toList();
      }
    }
    return buildData();
  }

  buildData() {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: searchData.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: ListTile(
                    onTap: () {
                      close(context, jsonEncode(searchData[index]));
                      // Navigator.pop(context, jsonEncode(searchData[index]));
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    tileColor: AppColors.kWhiteColor,
                    leading: const Icon(Icons.manage_search_rounded, size: 48),
                    title: TextWidgets.textBold(
                        title: searchData[index][firstSearchColumn],
                        fontSize: 18,
                        textColor: AppColors.kBlackColor),
                    subtitle: TextWidgets.text300(
                        title: searchData[index][secondSearchColumn] ?? '',
                        fontSize: 14,
                        textColor: AppColors.kBlackColor),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                  ),
                );
              }),
        ),
      ],
    );
  }
}
