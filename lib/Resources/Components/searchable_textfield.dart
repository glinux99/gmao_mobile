import 'package:flutter/material.dart';

import '../../Resources/Components/texts.dart';
import '../../Resources/Constants/global_variables.dart';

class SearchableTextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final Color textColor;
  final Color backColor;
  final Color? overlayColor;
  final bool? isEnabled;
  final bool? isObsCured;
  final TextEditingController editCtrller;
  int? maxLines = 1;
  int maxLength = 255;
  Function callback;
  List data;
  final String displayColumn, indexColumn;
  String? secondDisplayColumn, errorText = "Aucune donnée trouvée";

  SearchableTextFormFieldWidget(
      {super.key,
      required this.hintText,
      required this.textColor,
      required this.backColor,
      required this.editCtrller,
      this.overlayColor,
      TextInputType? inputType,
      maxLength,
      this.maxLines = 1,
      this.isEnabled,
      this.isObsCured,
      required this.callback,
      required this.data,
      required this.displayColumn,
      this.secondDisplayColumn,
      required this.indexColumn,
      this.errorText});

  @override
  _SearchableTextFormFieldWidgetState createState() =>
      _SearchableTextFormFieldWidgetState();
}

class _SearchableTextFormFieldWidgetState
    extends State<SearchableTextFormFieldWidget> {
  List searchedData = [];
  final layerLink = LayerLink();
  final focusNode = FocusNode();

  @override
  void initState() {
    searchedData =
        widget.data.length > 20 ? widget.data.sublist(0, 20) : widget.data;
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // showOverlay();
      widget.editCtrller.addListener(() {
        if (widget.editCtrller.text.isEmpty) {
          searchedData = widget.data;
        } else {
          if (widget.secondDisplayColumn != null) {
            searchedData = widget.data.where((element) {
              return element[widget.displayColumn]
                      .toString()
                      .toLowerCase()
                      .replaceAll(' ', '')
                      .replaceAll('/', '')
                      .contains(widget.editCtrller.text
                          .toLowerCase()
                          .trim()
                          .replaceAll(' ', '')
                          .replaceAll('/', '')) ||
                  element[widget.secondDisplayColumn!]
                      .toString()
                      .toLowerCase()
                      .replaceAll(' ', '')
                      .replaceAll('/', '')
                      .contains(widget.editCtrller.text
                          .toLowerCase()
                          .trim()
                          .replaceAll(' ', '')
                          .replaceAll('/', ''));
            }).toList();
          } else {
            searchedData = widget.data.where((element) {
              return element[widget.displayColumn]
                  .toString()
                  .toLowerCase()
                  .replaceAll(' ', '')
                  .replaceAll('/', '')
                  .contains(widget.editCtrller.text
                      .toLowerCase()
                      .trim()
                      .replaceAll(' ', '')
                      .replaceAll('/', ''));
            }).toList();
          }
        }
        setState(() {});
      });
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          // searchedData = widget.data;
          if (widget.editCtrller.text.isEmpty) {
            searchedData = widget.data;
            setState(() {});
          } else {
            if (widget.secondDisplayColumn != null) {
              searchedData = widget.data.where((element) {
                return element[widget.displayColumn]
                        .toString()
                        .toLowerCase()
                        .contains(
                            widget.editCtrller.text.toLowerCase().trim()) ||
                    element[widget.secondDisplayColumn!]
                        .toString()
                        .toLowerCase()
                        .contains(widget.editCtrller.text.toLowerCase().trim());
              }).toList();
            } else {
              searchedData = widget.data.where((element) {
                return element[widget.displayColumn]
                    .toString()
                    .toLowerCase()
                    .contains(widget.editCtrller.text.toLowerCase().trim());
              }).toList();
            }
          }
          showOverlay();
        } else {
          if (searchedData.isNotEmpty) {
            widget.callback(searchedData[0][widget.indexColumn]);
          }
          removeOverlay();
        }
        setState(() {});
      });
    });
  }

  OverlayEntry? entry;

  showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    // final offset = renderBox.localToGlobal(Offset.zero);
    entry = OverlayEntry(
        builder: (context) => Positioned(
            // left: offset.dx,
            // top: offset.dy + size.height + 8,
            width: size.width - 20,
            child: CompositedTransformFollower(
              showWhenUnlinked: false,
              offset: const Offset(0, 40),
              link: layerLink,
              child: searchedData.isNotEmpty ? buildOverlay() : Container(),
            )));
    overlay.insert(entry!);
  }

  buildOverlay() {
    return Material(
      elevation: 8,
      color: widget.overlayColor,
      child: ConstrainedBox(
        constraints: BoxConstraints(
            minHeight: 10,
            maxHeight: widget.data.isNotEmpty
                ? MediaQuery.of(context).size.height / 2.5
                : 100),
        child: widget.data.isNotEmpty
            ? Stack(
                children: [
                  ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      shrinkWrap: true,
                      itemCount: searchedData.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          onTap: () {
                            focusNode.unfocus();
                            // print(searchedData);
                            removeOverlay();
                            widget.callback(
                                searchedData[index][widget.indexColumn]);
                            widget.editCtrller.text =
                                "${searchedData[index][widget.displayColumn]} ${widget.secondDisplayColumn != null ? " - ${searchedData[index][widget.secondDisplayColumn]}" : ''}";
                          },
                          title: TextWidgets.textBold(
                              title:
                                  "${searchedData[index][widget.displayColumn]} ${widget.secondDisplayColumn != null ? " - ${searchedData[index][widget.secondDisplayColumn]}" : ''}",
                              fontSize: 14,
                              textColor: widget.textColor),
                        );
                      }),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: GestureDetector(
                          onTap: () {
                            removeOverlay();
                            setState(() {
                              focusNode.unfocus();
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              child: Icon(Icons.close,
                                  color: AppColors.kBlackColor))))
                ],
              )
            : Container(),
      ),
    );
  }

  removeOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  void dispose() {
    super.dispose();
    entry?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.hintText,
            style: TextStyle(color: widget.textColor.withOpacity(0.6)),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: widget.backColor,
                borderRadius: BorderRadius.circular(kDefaultPadding / 4)),
            child: CompositedTransformTarget(
              link: layerLink,
              child: TextFormField(
                focusNode: focusNode,
                maxLines: 1,
                style: TextStyle(color: widget.textColor),
                textAlign: TextAlign.left,
                controller: widget.editCtrller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  hintText: widget.hintText,
                  hintStyle:
                      TextStyle(color: widget.textColor.withOpacity(0.5)),
                  border: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: widget.textColor, width: 1)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: widget.textColor, width: 2)),
                  // hintText: widget.hintText,
                  // hintStyle:
                  //     TextStyle(color: widget.textColor.withOpacity(0.5))
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
