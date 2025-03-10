import 'package:flutter/material.dart';

import '../../Resources/Components/texts.dart';
import '../../Resources/Constants/global_variables.dart';
import '../../Resources/Constants/responsive.dart';
import '../../Resources/Models/Menu/list_item.model.dart';

class ListItem extends StatefulWidget {
  Color? backColor = AppColors.kTextFormBackColor;
  Color? textColor = AppColors.kPrimaryColor;
  final String title, subtitle;
  final List<ListItemModel>? detailsFields;
  final ListItemModel? middleFields;
  final IconData? icon, updateIcon, deleteIcon;
  bool? hasUpdate, hasDelete, keepMidleFields;
  dynamic data;
  dynamic IconWidget;
  void Function()? updateCallback, deleteCallback, detailsCallBack;

  ListItem(
      {super.key,
      required this.title,
      required this.subtitle,
      this.backColor,
      this.IconWidget,
      this.textColor,
      this.middleFields,
      this.detailsFields,
      this.hasUpdate = false,
      this.hasDelete = false,
      this.keepMidleFields = false,
      this.icon,
      this.updateIcon = Icons.border_color,
      this.deleteIcon = Icons.delete,
      this.updateCallback,
      this.detailsCallBack,
      this.deleteCallback,
      this.data});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool selectedItem = false;
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   await context.read<DeleteSelectedProvider>().get();
    //   // print(widget.detailsFields?.map((e) => e.title).toList());
    // });
  }

  bool displayDetails = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.detailsFields != null && widget.detailsFields!.isNotEmpty
          ? () {
              // print('display');
              setState(() {
                displayDetails = !displayDetails;
              });
            }
          : null,
      // onLongPress: () async {
      //   setState(() {
      //     selectedItem = !selectedItem;
      //   });
      //   if (selectedItem) {
      //     await context
      //         .read<DeleteSelectedProvider>()
      //         .addDataToList(widget.data);
      //   } else {
      //     await context
      //         .read<DeleteSelectedProvider>()
      //         .deleteDataToList(widget.data);
      //   }
      //   // print(context.read<DeleteSelectedProvider>().offlineData);
      // },
      child: AnimatedContainer(
        margin: const EdgeInsets.all(8),
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
            color: widget.backColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, displayDetails == true ? 1 : 0),
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: displayDetails == true ? 2.0 : 0,
                  spreadRadius: 0)
            ]),
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: selectedItem
                  ? AppColors.kPrimaryColor.withOpacity(.1)
                  : widget.backColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                InkWell(
                  // onTap: widget.detailsCallBack,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.icon != null)
                        Card(
                            color: widget.textColor!.withOpacity(0.1),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: widget.IconWidget ??
                                    Icon(widget.icon,
                                        color: widget.textColor!))),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextWidgets.textBold(
                                              title: widget.title.toString(),
                                              fontSize: 14,
                                              maxLines: 1,
                                              textColor: widget.textColor!),
                                          const SizedBox(height: 8),
                                          TextWidgets.text300(
                                              title: widget.subtitle.toString(),
                                              fontSize: 14,
                                              maxLines: 1,
                                              textColor: widget.textColor!),
                                        ]),
                                  ),
                                  if ((widget.middleFields != null &&
                                          Responsive.isWeb(context)) ||
                                      widget.keepMidleFields == true)
                                    Align(
                                        alignment: widget.hasUpdate == true &&
                                                widget.hasDelete == true
                                            ? Alignment.center
                                            : Alignment.centerRight,
                                        child: DetailItem(
                                          displayLabel:
                                              widget.middleFields?.displayLabel,
                                          data: widget.middleFields,
                                          textColor: widget.textColor!,
                                          backColor: widget.backColor!,
                                        ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.hasUpdate == true || widget.hasDelete == true)
                        const SizedBox(width: 8),
                      if (widget.hasUpdate == true || widget.hasDelete == true)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.hasUpdate == true)
                                GestureDetector(
                                  onTap: widget.updateCallback,
                                  child: Icon(widget.updateIcon!,
                                      color: AppColors.kPrimaryColor),
                                ),
                              if (widget.hasDelete == true)
                                const SizedBox(width: 10),
                              if (widget.hasDelete == true)
                                GestureDetector(
                                  onTap: widget.deleteCallback,
                                  child: Icon(widget.deleteIcon!,
                                      color: AppColors.kRedColor),
                                ),
                            ],
                          ),
                        )
                    ],
                  ),
                ),
                if (displayDetails == true &&
                    widget.detailsFields != null &&
                    widget.detailsFields!.isNotEmpty)
                  Divider(
                    color: AppColors.kBlackColor,
                    thickness: 1.0,
                  ),
                Visibility(
                  visible: displayDetails,
                  child: Wrap(
                      // alignment: WrapAlignment.spaceBetween,
                      runAlignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.horizontal,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ...List.generate(
                          widget.detailsFields!.length,
                          (index) => DetailItem(
                            hasSubtitle: true,
                            data: widget.detailsFields![index],
                            textColor: widget.textColor!,
                            backColor: widget.backColor!,
                          ),
                        ),
                        widget.middleFields != null &&
                                !Responsive.isWeb(context) &&
                                widget.keepMidleFields == false
                            ? DetailItem(
                                hasSubtitle: true,
                                data: widget.middleFields,
                                textColor: widget.textColor!,
                                backColor: widget.backColor!,
                              )
                            : Container()
                      ]),
                )
              ],
            )),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final ListItemModel? data;
  Color? textColor, backColor;
  bool? hasSubtitle = false, displayLabel;

  DetailItem(
      {super.key,
      required this.data,
      this.textColor = Colors.black,
      this.backColor = Colors.white,
      this.hasSubtitle = false,
      this.displayLabel = true});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backColor!,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            mainAxisSize:
                Responsive.isWeb(context) ? MainAxisSize.min : MainAxisSize.min,
            children: [
              if (data != null && data?.icon != null) data!.icon!,
              if (data != null && data?.icon != null) const SizedBox(width: 8),
              if (hasSubtitle == false && displayLabel == true)
                Flexible(
                    child: TextWidgets.textNormal(
                        title: data?.value ?? "",
                        fontSize: 14,
                        textColor: textColor!)),
              if (hasSubtitle == true && displayLabel == true)
                TextWidgets.textWithLabel(
                    title: data?.title ?? '',
                    value: data?.value ?? '',
                    fontSize: 14,
                    textColor: textColor!)
            ]),
      ),
    );
  }
}
